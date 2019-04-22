import 'package:flutter/material.dart';
import 'moviecell.dart';
import 'moviedetail.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:loader_search_bar/loader_search_bar.dart';

class searchbar extends StatefulWidget {
  @override
  _searchbarState createState() => _searchbarState();
}

class _searchbarState extends State<searchbar> {
  Color start = Color(0xFF42275a);
  Color end = Color(0xFF734b6d);
  Color purpble = Color(0xFFB5444A);
  List movieData;
  int _totalPages;
  int _page = 1;
  bool _noResults = false;
  String _searchTerm = "";
  TextEditingController _inputController =
      new TextEditingController(); //used to clear the search text
  FocusNode _inputFocus = new FocusNode(); //

  Future<Map> fetchMovies(String searchTerm, int page) async {
    final response = await http.get(
        "https://api.themoviedb.org/3/search/movie?api_key=6866b6e81ff7327379e4b8d14ba50af1&language=en-US&query=" +
            searchTerm +
            "&page=" +
            page.toString() +
            "&include_adult=false");
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
  }
  void _getMovies(String term){
    if(term != null || term != ""){
      fetchMovies(term, _page++).then((Map map){
        setState((){
          _totalPages = map['total_pages'];
          List data = map['results'];
          
          if(data != null && data.isNotEmpty){
            if(movieData != null)
              movieData.addAll(data);
            else
              movieData = data;
          }else{
            _noResults = true;
          }
        });
      });
    }    
  }
   Widget _showClearSearch(){
    if(_searchTerm != ""){
      return new IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          _searchTerm = "";
          _inputController.clear();
          FocusScope.of(context).requestFocus(_inputFocus);
        },
      );
    }
    return Container();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(appBarTheme: AppBarTheme(color: start)),
        home: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              centerTitle: true,
              title: TextField(
          controller: _inputController,
          focusNode: _inputFocus,
          autofocus: true,
          decoration: InputDecoration( 
            
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(
                 color: Colors.white30
            )
          ),
          style: TextStyle(
            fontSize: 20.0, 
            color: Colors.white,
            fontFamily: 'Bebas-Regular'
          ),
          onChanged: (String term){
            _page = 1;
            _searchTerm = term;
            movieData = new List();
            _noResults = false;
            _getMovies(term);
            
          },
          onSubmitted: (String term){
            _page = 1;
            _searchTerm = term;
            movieData = new List();
            _noResults = false;
            _getMovies(term);
            
          },
        ),
        actions: <Widget>[
          _showClearSearch(),
        ],
      ),
          
            body: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [start, end],
                        begin: const FractionalOffset(0.5, 0.0),
                        end: const FractionalOffset(0.0, 0.5),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp)),
                child: movieData == null   
                    ? Center(
                           child:   Text(
                             'Look For a Movie!',
                             style: TextStyle(
                               fontFamily: 'Arvo-Bold',
                               color: Colors.white,
                               fontSize: 30,
                             ),
                           )
            
                    )
                    : ListView.builder(
                        itemCount: movieData.length,
                        itemBuilder: (BuildContext, i) {
                          return FlatButton(
                child: moviecell(movieData, i),
                padding: const EdgeInsets.all(0.0),
               
                onPressed:() {
                  Navigator.push(context, new MaterialPageRoute(builder: 
                  (context){
                    return moviedetails(movieData[i]);
                  }

                  ));
                },

              );
                        }))));
  }
}
