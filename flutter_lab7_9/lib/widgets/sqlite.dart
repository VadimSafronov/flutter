import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterlab79/blocs/bloc.dart';
import 'package:flutterlab79/model/food_model.dart';
import 'package:flutterlab79/model/fruit.dart';
import 'package:flutterlab79/model/fruit_factory.dart';
import 'package:flutterlab79/repository/fruit_repository.dart';

class SqliteWidget extends StatelessWidget {
  static String routeName = "/sqlite";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SqliteBloc(fruitRepository: new FruitRepository())
        ..add(FoodLoadSuccess()),
      child: SqliteBlocWidget(),
    );
  }
}

class SqliteBlocWidget extends StatefulWidget {
  SqliteBlocWidget({Key key}) : super(key: key);
  @override
  _SqliteBlocWidgetState createState() {
    return _SqliteBlocWidgetState();
  }
}

class _SqliteBlocWidgetState extends State<SqliteBlocWidget> {
  final nameController = TextEditingController();
  final gramsController = TextEditingController();
  final caloriesController = TextEditingController();
  final wightController = TextEditingController();
  final idController = TextEditingController();

  List<FoodModel> listFoods;
  Fruit fruit;
  FruitFactory fruitFactory = new FruitFactory();
  SqliteBloc _sqliteBloc;

  @override
  void initState() {
    super.initState();
    _sqliteBloc = BlocProvider.of<SqliteBloc>(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SqliteBloc, SqliteState>(
      builder: (context, state) {
        if (state is SqliteLoadInProgress) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SqliteLoadSuccess) {
          listFoods = state.foods;
        }
        return Scaffold(
            appBar: AppBar(
              title: Text("Sqlite"),
            ),
            body: Column(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: _buildListFruits(context, listFoods),
                ),
                Expanded(flex: 4, child: _buildInputFields()),
                Expanded(flex: 1, child: _buildButtons(_sqliteBloc))
              ],
            ));
      },
    );
  }

  Widget _buildListFruits(BuildContext context, List<FoodModel> foods) {
    return new ListView.builder(
      itemBuilder: (context, int i) {
        return Card(
            child: ListTile(
                leading: Text(
                  '${foods[i].id}',
                  style: TextStyle(fontSize: 15.0),
                ),
                title: Row(
                  children: <Widget>[
                    Text(foods[i].name),
                    Spacer(),
                    Text(foods[i].grams.toString()),
                    Spacer(),
                    Text(foods[i].calories.toString()),
                    Spacer(),
                    Text(foods[i].weight.toString()),
                  ],
                )));
      },
      itemCount: foods.length,
    );
  }

  Widget _buildInputFields() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        children: <Widget>[
          TextFormField(
              controller: idController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly
              ],
              decoration: _getDecoration("Id")),
          TextFormField(
              controller: nameController, decoration: _getDecoration("Name")),
          TextFormField(
              controller: gramsController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly
              ],
              decoration: _getDecoration("Grams")),
          TextFormField(
              controller: caloriesController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly
              ],
              decoration: _getDecoration("Calories")),
          TextField(
              controller: wightController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly
              ],
              decoration: _getDecoration("Weight"))
        ],
      ),
    );
  }

  Widget _buildButtons(sqliteBloc) {
    return Row(
      children: <Widget>[
        RaisedButton(
          child: Text("Add"),
          onPressed: () {
            _addFruit();
          },
        ),
        RaisedButton(
          child: Text("Update"),
          onPressed: () {
            _updatedFruit();
          },
        ),
        RaisedButton(
          child: Text("Delete"),
          onPressed: () {
            _deleteFruit();
          },
        ),
      ],
    );
  }

  void _addFruit() {
    final fruit = _generateFruit();
    _sqliteBloc.add(FoodAdded(fruit));
  }

  void _updatedFruit() {
    final fruit = _generateFruit();
    fruit.id = int.parse(idController.text);
    _sqliteBloc.add(FoodUpdated(fruit));
  }

  void _deleteFruit() {
    final fruit = _generateFruit();
    fruit.id = int.parse(idController.text);
    _sqliteBloc.add(FoodDeleted(fruit.id));
  }

  Fruit _generateFruit() {
    String name = nameController.text;
    int grams = int.parse(gramsController.text);
    int calories = int.parse(caloriesController.text);
    int weight = int.parse(wightController.text);
    return fruitFactory.create(name, grams, calories, weight);
  }

  InputDecoration _getDecoration(String label) {
    return InputDecoration(
        focusedBorder: new UnderlineInputBorder(
            borderSide: new BorderSide(
                color: Colors.orange, width: 2, style: BorderStyle.solid)),
        // hintText: "Student Name",
        labelText: label,
        fillColor: Colors.white,
        labelStyle: TextStyle(
          color: Colors.orange,
        ));
  }
}
