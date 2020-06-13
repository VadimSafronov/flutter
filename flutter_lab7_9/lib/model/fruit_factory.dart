import 'package:flutterlab79/model/factory.dart';
import 'package:flutterlab79/model/food_model.dart';
import 'package:flutterlab79/model/fruit.dart';

class FruitFactory implements Factory {
  @override
  FoodModel create(name, grams, calories, weight) {
    return new Fruit(name, grams, calories, weight);
  }
}
