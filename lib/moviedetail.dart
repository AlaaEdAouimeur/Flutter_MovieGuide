import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class moviedetails extends StatelessWidget {
  final movies;
  Color orange = Color(0xFFB5444A);
  Color purpble = Color(0XFF942755);
Color start =Color(0xFFf12711);
Color end = Color(0xFFf5af19);
  var image_url = 'https://image.tmdb.org/t/p/w500/';
  moviedetails(this.movies);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image.network(image_url + movies['backdrop_path'],
              fit: BoxFit.cover),
          BackdropFilter(
            filter: new ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: new Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                 
               Stack(
                 
                 children: <Widget>[
                      Container(
                   child : Container(
                    alignment: Alignment.center,
                    child: Container(
                      width: 400,
                      height: 400,
                    ),
                    decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(10.0),
                        image: new DecorationImage(
                            image: new NetworkImage(
                                image_url + movies['poster_path']),
                            fit: BoxFit.contain),
                        boxShadow: [
                          new BoxShadow(
                              color: Colors.black,
                              blurRadius: 20.0,
                              offset: new Offset(0.0, 10.0))
                        ]),
                        
                  ),
                  
                  ),
                InkWell(
                  child: Container(
                    width:55 ,
                    height: 55,
                   
                   child: Icon(
                     Icons.video_call,
                     color: Colors.white,
                   ),
                 decoration: BoxDecoration(
                      borderRadius: new BorderRadius.circular(180),
                  gradient: LinearGradient(
                    colors: [start,end],
                    begin: const FractionalOffset(0.5, 0.0),
                    end: const FractionalOffset(0.0, 0.5),
                    stops: [0.0,1.0],
                  )
                 ),
                    
                  ),
                )
                 
                 ],
                 alignment: AlignmentDirectional.bottomEnd,
               ),
                  new Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 0.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(movies['title'],
                                style: new TextStyle(
                                    color: Colors.white,
                                    fontSize: 30.0,
                                    fontFamily: 'Bebas-Regular'))),
                        Text('${movies['vote_average']}/10',
                            style: new TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontFamily: 'Bebas-Regular'))
                      ],
                    ),
                  ),
                  new Text(movies['overview'],
                      style: new TextStyle(
                          color: Colors.white, fontFamily: 'Bebas-Regular')),
                  new Padding(padding: const EdgeInsets.all(10.0)),
                  Row(
                    children: <Widget>[
                      new Expanded(
                          child: new Container(
                        width: 150.0,
                        height: 60.0,
                        alignment: Alignment.center,
                        child: new Text(
                          'Rate Movie',
                          style: new TextStyle(
                              color: Colors.white,
                              fontFamily: 'Bebas-Regular',
                              fontSize: 20.0,
                              fontStyle: FontStyle.italic),
                        ),
                        decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(10.0),
                            color: purpble),
                      )),
                      new Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: new Container(
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.center,
                          child: new Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                          decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.circular(10.0),
                              color: purpble),
                        ),
                      ),
                      new Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Container(
                            padding: const EdgeInsets.all(16.0),
                            alignment: Alignment.center,
                            child: new Icon(
                              Icons.bookmark,
                              color: Colors.white,
                            ),
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(10.0),
                                color: orange),
                          )),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

