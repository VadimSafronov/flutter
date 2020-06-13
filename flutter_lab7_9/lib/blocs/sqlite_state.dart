import 'package:flutterlab79/model/food_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SqliteState {
  const SqliteState();
}

class SqliteLoadInProgress extends SqliteState {}
// Подгрузка
class SqliteLoadSuccess extends SqliteState {
  final List<FoodModel> foods;

  const SqliteLoadSuccess([this.foods = const []]);

  @override
  String toString() => 'TodosLoadSuccess { todos: $foods }';
}

class TodosLoadFailure extends SqliteState {}
