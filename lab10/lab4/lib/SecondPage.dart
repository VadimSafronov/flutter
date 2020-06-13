import 'package:cuberto_bottom_bar/cuberto_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lab4/MainPage.dart';
import 'package:hive/hive.dart';

// создаем класс в котором будет наша моделька
// создаем свои типы
// присваиваем id — typeId: 1
@HiveType(typeId: 1)
class Model {

  @HiveField(0)
  String size;

  @HiveField(1)
  String color;

  @override
  String toString() {
    return '$size $color ';
  }
}
// Дальше идет работа с виджетм ( указываем маршрут,разметку и actions)
class SecondPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SecondPageState();
  }
}

class SecondPageState extends State<SecondPage> {
  String dropdownValue = 'S';
  String dropdownValue2 = 'GREEN';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/127.jpg"),
                  fit: BoxFit.cover
              )
            ),
          ),
          Positioned(
            left: 5,
            top: 15,
            width: 45,
            child: MaterialButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()),);
              },
              color: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
              child: Column(
                children: <Widget>[
                  Icon(Icons.arrow_back_ios, color:Colors.white),
                ],
              ),

            )

          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              width: 200,
              height: 220,
              color:Colors.black.withOpacity(0.2)
            ),
          ),
          Positioned(
            right: 0,
            bottom: 220,
            child: Container(
              width: 212,
              height: 140,
              color: Colors.white,
              child: Text('ADD TO CART',textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Open Sans',
                      fontSize: 15)
              ),padding: const EdgeInsets.only(top: 60)
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
                width: 212,
                height: 140,
                color: Color.fromRGBO(20, 38, 18,0.5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('NEW LOOK COAT',textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Open Sans',
                          fontSize: 15)
                  ),
                  Text('WOMEN',textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.2),
                          fontFamily: 'Open Sans',
                          fontSize: 15)
                  ),
                ],
              ), padding: EdgeInsets.only(left:65),
             
            ),
          ),
          Positioned(
            right:0,
            top: 140,
            child: Container(
              width: 212,
              height: 276,
              color: Color.fromRGBO(20, 38, 18, 0.35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top:35,bottom:25),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left:0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('PRICE',textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontFamily: 'Open Sans',
                                  fontSize: 15)
                          ),
                          Text('120',textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Open Sans',
                                  fontSize: 15)
                          ),
                              ],
                            ),
                          )
                        ],
                      )
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom:25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          DropdownButton<String>(
                            value: dropdownValue,
                            icon: Icon(Icons.arrow_drop_down),
                            dropdownColor: Colors.greenAccent,
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(
                                color: Colors.white
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                              });
                            },
                            items: <String>['M', 'S']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            })
                                .toList(),
                          ),
                          Text(dropdownValue,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Open Sans',
                                  fontSize: 15)
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          DropdownButton<String>(
                            value: dropdownValue2,
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            elevation: 16,
                            dropdownColor: Colors.greenAccent,
                            style: TextStyle(
                                color: Colors.white
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue2 = newValue;
                              });
                            },
                            items: <String>['GREEN','BLUE','RED']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            })
                                .toList(),
                          ),
                          Text(dropdownValue2,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Open Sans',
                                  fontSize: 15)
                          ),
                        ],
                      ),
                    ),
                  ],
              ),padding: EdgeInsets.only(left:65),
            ),


          ),
        ],
      ),
    );
  }

}
