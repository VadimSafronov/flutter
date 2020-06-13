import 'package:flutterlab79/model/food_model.dart';

abstract class Factory {
  FoodModel create(name, grams, calories, habitat);
}
