import 'package:flutterlab79/model/factory.dart';
import 'package:flutterlab79/model/food_model.dart';
import 'package:flutterlab79/model/vegetable.dart';

class VegetableFactory implements Factory {
  @override
  FoodModel create(name, grams, calories, habitat) {
    return new Vegetable(name, grams, calories, habitat);
  }
}
