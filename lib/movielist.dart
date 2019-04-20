import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'moviecell.dart';
import 'moviedetail.dart';
class movielist extends StatefulWidget {
  @override
  movielistState createState() => movielistState();
}

class movielistState extends State<movielist> {
  Map data;
  List Movies;

  Future getdata() async {
    http.Response response = await http.get(
        'https://api.themoviedb.org/3/discover/movie?api_key=1a293cbbabf99e68f7c2ae63f7e0fade&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false');
    data = json.decode(response.body);
    setState(() {
      Movies = data['results'];
    });
   
    print(Movies.toString());
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  
  Widget build(BuildContext context) {
    getdata();
    return Movies == null
        ? Center(
            child: CircularProgressIndicator(
            backgroundColor: Colors.redAccent,

            strokeWidth: 5,
          ))
        : ListView.builder(
            itemCount: Movies.length,
            itemBuilder: (BuildContext, i) {
              return FlatButton(
                child: moviecell(Movies, i),
                padding: const EdgeInsets.all(0.0),
               
                onPressed:() {
                  Navigator.push(context, new MaterialPageRoute(builder: 
                  (context){
                    return moviedetails(Movies[i]);
                  }

                  ));
                },

              );
            });
  }
}
 