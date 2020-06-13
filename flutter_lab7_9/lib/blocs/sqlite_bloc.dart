import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutterlab79/model/food_model.dart';
import 'package:flutterlab79/repository/fruit_repository.dart';
import './bloc.dart';


class SqliteBloc extends Bloc<SqliteEvent, SqliteState> {
  final FruitRepository fruitRepository;
// указываем,что будет в SqliteBloc
  SqliteBloc({this.fruitRepository});

  @override
  SqliteState get initialState => SqliteLoadInProgress();
  // инициализируем состояние sqlite

  @override
  Stream<SqliteState> mapEventToState(SqliteEvent event) async* {
    // Поток в котором будет идти обработка наших событий
    if (event is FoodLoadSuccess) {
      final fruits = await fruitRepository.getAll();
      yield SqliteLoadSuccess(fruits);
    }
    if (event is FoodAdded) {
      if (state is SqliteLoadSuccess) {
        final fruitToAdd = event.food;
        fruitToAdd.id = await fruitRepository.add(fruitToAdd);
        final List<FoodModel> updatedTodos =
            List.from((state as SqliteLoadSuccess).foods)..add(event.food);
        yield SqliteLoadSuccess(updatedTodos);
      }
    }
    if (event is FoodDeleted) {
      if (state is SqliteLoadSuccess) {
        final id = await fruitRepository.delete(event.idFood);
        final updatedTodos = (state as SqliteLoadSuccess)
            .foods
            .where((todo) => todo.id != id)
            .toList();
        yield SqliteLoadSuccess(updatedTodos);
      }
    }
    if (event is FoodUpdated) {
      if (state is SqliteLoadSuccess) {
        final id = await fruitRepository.update(event.food);
        final List<FoodModel> updatedTodos =
            (state as SqliteLoadSuccess).foods.map((todo) {
          return todo.id == id ? event.food : todo;
        }).toList();
        yield SqliteLoadSuccess(updatedTodos);
      }
    }
  }
}
