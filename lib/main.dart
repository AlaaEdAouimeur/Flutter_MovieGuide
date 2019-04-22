import 'package:flutter/material.dart';
import 'movielist.dart';
import 'searchbar.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MovieGuide.',
      home: home(),
      
    );
  }
}

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}



class _homeState extends State<home> {
  
Color orange =Color(0xFFB5444A);
Color orange2 =Color(0xFFB5444A);
Color deeppurple =Color(0xFFF17935);
Color purpble = Color(0XFF942755);

Color start =Color(0xff0F2027);
Color end =Color(0xff2C5364);

  @override
  
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      appBar: new AppBar(
        elevation:01,
        centerTitle: true,
        backgroundColor: start,
        leading: new Icon(
          Icons.menu,
          color: orange,
        ),
        title: new Text(
          'MovieGuide.',
          style: new TextStyle(
              color: purpble,
              fontFamily: 'Bebas-Regular',
              fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          InkWell(
               child: new Icon(
              Icons.search,
              color: orange2,
              size: 30,
            ),
            onTap: (){
             
             Navigator.push(context, MaterialPageRoute(
               builder: (context){
                 return searchbar();
               }
             ));

            },
          ),
       
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [start,end],
               begin: const FractionalOffset(0.5, 0.0),
                end: const FractionalOffset(0.0, 0.5),
                stops: [0.0,1.0],
                tileMode: TileMode.clamp
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: page('Discover'),
              ),
              Expanded(
               child : movielist()
              )
            ],
          ),
        ),
      ),
    );
  }
}

class page extends StatelessWidget {
  final String text;
Color orange =Color(0xFFB5444A);

Color lightorange =Color(0xFFF17935);
Color purpble = Color(0XFF942755);


  page(this.text);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(14.0, 0.0, 14.0, 14.0),
        child: Text(
          text,
          style: TextStyle(fontSize: 40.0, color: purpble, fontFamily: 'Bebas-Regular',fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        )  
        );
  }
}

