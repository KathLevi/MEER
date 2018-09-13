import 'dart:ui';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  SearchState createState() {
    return SearchState();
  }
}

class SearchState extends State<Search> {
  final _formKey = new GlobalKey<FormState>();

  void _goToPair(String searchTerm) {
    Navigator.pushNamed(context, '/pairs');
  }

  void _emptySearch() {}

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: TextField(
        onSubmitted: _goToPair,
        decoration: new InputDecoration(
            labelText: "Search Term", icon: Icon(Icons.search)),
      ),
    );
  }
}
