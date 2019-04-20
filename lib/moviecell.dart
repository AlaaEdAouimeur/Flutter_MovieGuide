import 'package:flutter/material.dart';

class moviecell extends StatelessWidget {
  Color orange = Color(0xFFB5444A);

  Color deeppurple = Color(0xFF861A58);
  Color purpble = Color(0XFF942755);

  final movies;
  final i;
  var image_url = 'https://image.tmdb.org/t/p/w185/';
  moviecell(this.movies, this.i);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  margin: const EdgeInsets.all(16.0),
                  child: Container(
                    width: 70.0,
                    height: 100.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.circular(10.0),
                    color: Colors.black,
                    image: DecorationImage(
                        image:
                            NetworkImage(image_url + movies[i]['poster_path']),
                        fit: BoxFit.fill),
                    boxShadow: [
                      BoxShadow(
                          color: deeppurple,
                          blurRadius: 3,
                          offset: new Offset(2.0, 5.0))
                    ],
                  ),
                )),
            Expanded(
                child: new Container(
              margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: Column(
                children: <Widget>[
                  new Text(
                    movies[i]['title'],
                    style: new TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Bebas-Regular',
                        fontWeight: FontWeight.bold,
                        color: orange),
                  ),
                  new Padding(padding: const EdgeInsets.all(2.0)),
                  new Text(
                    movies[i]['overview'],
                    maxLines: 3,
                    style: new TextStyle(
                        color: Colors.orangeAccent, fontFamily: 'Arvo-Italic'),
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ))
          ],
        ),
        new Container(
          width: 300.0,
          height: 0.5,
          color: const Color(0xD2D2E1ff),
          margin: const EdgeInsets.all(16.0),
        )
      ],
    );
  }
}
