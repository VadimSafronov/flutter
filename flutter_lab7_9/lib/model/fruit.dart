import 'package:flutterlab79/model/food_interface.dart';
import 'package:flutterlab79/model/food_model.dart';

class Fruit extends FoodModel implements FoodInterface {
  Fruit(name, grams, calories, weight) : super(name, grams, calories, weight);

  void display() {
    print("Name: $name");
    print("Grams: $grams");
    print("Calories: $calories");
    print("Habitat: $habitat");
    print("Total calories: ${getTotalCalories()}");
  }
}
