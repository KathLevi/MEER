import 'package:flutter/material.dart';
import 'package:meer/screens/results.dart';
import 'package:meer/API/the_movie_db.dart';
import 'package:meer/models/movie.dart';

class Search extends StatefulWidget {
  @override
  SearchState createState() {
    return SearchState();
  }
}

class SearchState extends State<Search> {
  Future<MovieList> movieList;

  void _search(String searchTerm) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                ResultsScreen(searchTerm: searchTerm)));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        onSubmitted: _search,
        decoration:
            InputDecoration(labelText: "Search Term", icon: Icon(Icons.search)),
      ),
    );
  }
}
