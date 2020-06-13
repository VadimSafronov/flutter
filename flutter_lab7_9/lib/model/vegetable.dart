import 'food_interface.dart';
import 'food_model.dart';

class Vegetable extends FoodModel implements FoodInterface {
  Vegetable(String name, int grams, int calories, int weight)
      : super(name, grams, calories, weight);

  @override
  void display() {
    print("Name: $name");
    print("Grams: $grams");
    print("Calories: $calories");
    print("Habitat: $habitat");
    print("Total calories: ${getTotalCalories()}");
  }
}
