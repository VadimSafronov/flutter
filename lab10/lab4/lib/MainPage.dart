import 'package:cuberto_bottom_bar/cuberto_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'SecondPage.dart';


int _current=0;
var some = new SecondPage();
class MainPage extends StatefulWidget {
  MainPageState createState()=> MainPageState();
}
  class MainPageState extends State<MainPage> {
    int _currentIndex = 0;
    int currentIndex = 0;
    final List<List<String>> models=[
      [
        'assets/123.jpg',
        'NEW LOOK TAILORED COAT',
      ],
      [
        'assets/124.jpg',
        'SUPER KRYTA',
      ],
      [
        'assets/125.jpg',
        'HELP',
      ],
    ];
    Container _myModels(String imageVal){
      return Container(
        width: 120,
        margin:  EdgeInsets.only(right:10),
        child: Card(
          child: Wrap(
            children: <Widget>[
              Image.network(imageVal)
            ],
          ),
        ),
      );
    }
    void _next(){
      setState(() {
        if(currentIndex<models.length-1){
          currentIndex++;
        }else{
          currentIndex=currentIndex;
        }
      });
    }
    void _prev(){
      setState(() {
        if(currentIndex>0){
          currentIndex--;
        }else{
          currentIndex=0;
        }
      });
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 250,
                height: 400,
                alignment: Alignment.topCenter,
                color: Colors.grey.withOpacity(0.8),
                child: Text('NEW COLLECTION',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Open Sans',
                        fontSize: 15)
                ),padding: const EdgeInsets.only(top: 15),
              ),
            ),
            Positioned(
              left:50,
              top: 50.0,
              width: 400,
              child: Container(
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onHorizontalDragEnd: (DragEndDetails details){
                        if(details.velocity.pixelsPerSecond.dx>0){
                          _prev();
                        }
                        else if(details.velocity.pixelsPerSecond.dx<0){
                          _next();
                        }
                      },
                   child: Container(
                      height:430,
                      width:375,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(models[currentIndex][0]),
                          fit: BoxFit.cover
                        )
                      ),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: <Widget>[
                         Container(
                           color: Color.fromRGBO(89, 139, 128, 0.9),
                           height:80,
                           width: MediaQuery.of(context).size.width,
                           padding: EdgeInsets.only(top:25,left:30),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[
                               Text(models[currentIndex][1], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17,fontStyle: FontStyle.italic),),
                               Padding(
                                 padding: EdgeInsets.only(top:15),
                               child: Container(
                                 width:90,
                                 child: Row(
                                   children: _buildIndicator(),
                                 ),
                               )
                               ),
                             ],
                           ),
                         )
                       ],
                     ),
                    )
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 65,
              bottom: 190.0,
              child: Container(
                  child: Text("YOU MAY LIKE", style: TextStyle(
                      fontSize: 17,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold))
              ),
            ),
            Positioned(
              right: 55,
              bottom: 175.0,
              child: FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()),);
                },
                child: Text(
                  "MORE >" ,style: TextStyle(
                    fontSize: 17,
                  color: Color.fromRGBO(89, 139, 128, 0.7),
                  fontWeight: FontWeight.bold)),
              )
            ),
              Positioned(
              bottom: 10.0,
              left:65,
              child: Row(
                children: <Widget>[
              Container(
                height:150,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    _myModels('http://images.asos-media.com/inv/media/3/4/1/6/8156143/whitegrey/image1xxl.jpg'),
                    _myModels('http://images.asos-media.com/inv/media/6/0/6/1/6541606/2146826246/image1xxl.jpg'),
                    _myModels('http://images.asos-media.com/inv/media/2/7/0/7/6357072/black/image1xxl.jpg'),
                    _myModels('http://images.asos-media.com/inv/media/3/2/4/6/6996423/silver/image1xxl.jpg'),
                    _myModels('http://images.asos-media.com/inv/media/2/7/0/7/6357072/black/image1xxl.jpg'),
                    _myModels('http://images.asos-media.com/inv/media/3/2/4/6/6996423/silver/image1xxl.jpg'),
                    _myModels('http://images.asos-media.com/inv/media/2/7/0/7/6357072/black/image1xxl.jpg'),
                    _myModels('http://images.asos-media.com/inv/media/3/2/4/6/6996423/silver/image1xxl.jpg'),
                  ],
                ),
              ),
                ],
              )
              ),
          ],
        ),
        ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey.withOpacity(0.4),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text(''),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text(''),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                title: Text(''),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text(''),
              ),
            ],
            onTap: (index){
              setState(() {
                _currentIndex=index;
              });
            },
            selectedItemColor: Color.fromRGBO(89, 139, 128, 0.7),
          )
      );
    }
    Widget _indicator(bool isActive){
      return Expanded(
        child: Container(
          height: 6,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
            color: isActive ? Colors.grey[800] : Colors.white
          ),
        )
      );
    }
    List<Widget> _buildIndicator(){
      List<Widget> indicators=[];
      for(int i=0;i<models.length;i++){
        if(currentIndex==i){
          indicators.add(_indicator(true));
        }
        else{
          indicators.add(_indicator(false));
        }
      }
      return indicators;
    }
  }

