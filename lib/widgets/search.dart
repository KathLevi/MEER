import 'package:flutter/material.dart';
import 'package:meer/screens/results.dart';

class Search extends StatefulWidget {
  @override
  SearchState createState() {
    return SearchState();
  }
}

class SearchState extends State<Search> {
  void _goToPair(String searchTerm) {
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
        onSubmitted: _goToPair,
        decoration: InputDecoration(
            labelText: "Search Term", icon: Icon(Icons.search)),
      ),
    );
  }
}
