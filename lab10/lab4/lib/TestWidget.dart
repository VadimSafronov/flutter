import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  TestWidget();
  //runApp(TestWidget());
}
// В этом файле тестим наш Виджет
// Вводим какой-то текст и он должен появится ниже на экране
class TestWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController input=TextEditingController();
  String text="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget Test"),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 250,
                    child: TextField(
                      key: Key('textfield'),
                      controller: input,
                    ),
                  ),
                  RaisedButton(
                    child: Text('Done'),
                    onPressed: (){
                      setState(() {
                        text=input.text;
                      });
                    },
                    color: Colors.blue,
                    textColor: Colors.white,
                  )
                ],
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                )
              )
            ],
          ),
        )
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}