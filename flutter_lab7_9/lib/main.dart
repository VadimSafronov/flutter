import 'package:flutter/material.dart';
import 'package:flutterlab79/path/path_ApplicationDocumentsDirectory.dart';
import 'package:flutterlab79/path/path_ApplicationSupportDirectory.dart';
import 'package:flutterlab79/path/path_ExternalStorageDirectory.dart';
import 'package:flutterlab79/path/path_TemporaryDirectory.dart';
import 'package:flutterlab79/path_provider.dart';
import 'package:flutterlab79/shared_preference.dart';
import 'package:flutterlab79/widgets/sqlite.dart';

import 'cloud_firestore/fireStoreCrud.dart';

void main() => runApp(MyApp());
// Наша входная точка в приложение
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
        routes: {
//          ExtractArgumentsScreen.routeName: (context) =>
//              ExtractArgumentsScreen(),
        // подключаем наши роуты
          SqliteWidget.routeName: (context) => SqliteWidget(),
          SharedPreferenceDemo.routeName: (context) => SharedPreferenceDemo(),
          PathPage.routeName: (context) => PathPage(title: 'path_provider'),
          PathDemo.routeName: (context) => PathDemo(storage: TextStorage()),
          PathTemporaryDirectory.routeName: (context) =>
              PathTemporaryDirectory(storage: TextStorageTemporaryDirectory()),
          PathApplicationSupportDirectory.routeName: (context) =>
              PathApplicationSupportDirectory(
                  storage: TextStorageApplicationSupportDirectory()),
          PathExternalStorageDirectory.routeName: (context) =>
              PathExternalStorageDirectory(
                  storage: TextStorageExternalStorageDirectory()),
          FirestoreCRUDPage.routeName: (context) => FirestoreCRUDPage()
        });
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Laba 7,8,9"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("SQLITE"),
              onPressed: () {
                Navigator.pushNamed(context, SqliteWidget.routeName);
              },
            ),
            RaisedButton(
              child: Text("Shared Preference"),
              onPressed: () {
                Navigator.pushNamed(context, SharedPreferenceDemo.routeName);
              },
            ),
            RaisedButton(
              child: Text("Path"),
              onPressed: () {
                Navigator.pushNamed(context, PathPage.routeName);
              },
            ),
            RaisedButton(
              child: Text("Path_ApplicationDocumentsDirectory"),
              onPressed: () {
                Navigator.pushNamed(context, PathDemo.routeName);
              },
            ),
            RaisedButton(
              child: Text("Path_TemporaryDirectory"),
              onPressed: () {
                Navigator.pushNamed(context, PathTemporaryDirectory.routeName);
              },
            ),
            RaisedButton(
              child: Text("Path_ApplicationSupportDirectory"),
              onPressed: () {
                Navigator.pushNamed(
                    context, PathApplicationSupportDirectory.routeName);
              },
            ),
            RaisedButton(
              child: Text("Path_ExternalStorageDirectory"),
              onPressed: () {
                Navigator.pushNamed(
                    context, PathExternalStorageDirectory.routeName);
              },
            ),
            RaisedButton(
              child: Text("FirestoreCRUDPage"),
              onPressed: () {
                Navigator.pushNamed(context, FirestoreCRUDPage.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
