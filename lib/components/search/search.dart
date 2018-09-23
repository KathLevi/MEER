import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:meer/components/pairs/specific_pairs.dart';
import 'package:meer/models/info_spec.dart';
import 'package:meer/components/info/info.dart';

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
        new MaterialPageRoute(
            builder: (BuildContext context) =>
                SpecificPairScreen(searchTerm: searchTerm)));
    
  }

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
