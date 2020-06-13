import 'package:flutterlab79/model/food_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SqliteEvent {
  const SqliteEvent();
}

// Классы с действиями

class FoodLoadSuccess extends SqliteEvent {}

class FoodAdded extends SqliteEvent {
  final FoodModel food;
  const FoodAdded(this.food);
}

class FoodDeleted extends SqliteEvent {
  final idFood;
  const FoodDeleted(this.idFood);
}

class FoodUpdated extends SqliteEvent {
  final FoodModel food;
  const FoodUpdated(this.food);
}
