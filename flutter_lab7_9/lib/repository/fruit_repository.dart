import 'package:flutterlab79/model/food_model.dart';
import 'package:sqflite/sqflite.dart';

import 'database_helper.dart';
// Репозиторий из 2ой лабы
// Реализованы методы работы с БД ( add,get,delete,update)
class FruitRepository {
  DatabaseHelper databaseHelper;

  FruitRepository() {
    databaseHelper = new DatabaseHelper();
  }

  Future<List<Map<String, dynamic>>> _getMapList() async {
    final Database db = await databaseHelper.database;
    final result = await db.rawQuery('SELECT * FROM fruits');
    return result;
  }

  Future<List<FoodModel>> getAll() async {
    List<FoodModel> list = new List<FoodModel>();
    List<Map<String, dynamic>> map = await _getMapList();
    int count = map.length;
    for (int i = 0; i < count; i++) {
      FoodModel foodModel = FoodModel.fromJson(map[i]);
      list.add(foodModel);
    }
    return list;
  }

  Future<int> add(FoodModel foodModel) async {
    final Database db = await databaseHelper.database;
    return await db.insert('fruits', foodModel.toJson());
  }

  Future<int> delete(int id) async {
    final Database db = await databaseHelper.database;
    return await db.delete(
      'fruits',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(FoodModel foodModel) async {
    final Database db = await databaseHelper.database;
    return await db.update(
      'fruits',
      foodModel.toJson(),
      where: 'id = ?',
      whereArgs: [foodModel.id],
    );
  }
}
