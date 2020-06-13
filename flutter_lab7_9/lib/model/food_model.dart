import 'package:equatable/equatable.dart';

class FoodModel extends Equatable {
  int id;
  String name;
  int grams;
  int calories;
  String habitat;
  int maxCalories = 1500;
  int weight;
  int price;

  int cost() {
    int cost = price * weight;
    return cost;
  }

  int getTotalCalories() {
    int total = grams * calories;
    return total;
  }

  FoodModel(this.name, this.grams, this.calories, this.weight);

  FoodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    calories = json['calories'];
    weight = json['weight'];
    price = json['price'];
    grams = json['grams'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['calories'] = this.calories;
    data['weight'] = this.weight;
    data['price'] = this.price;
    data['grams'] = this.grams;
    return data;
  }

  @override
  // TODO: implement props
  List<Object> get props => [id, name];
}
