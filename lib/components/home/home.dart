import 'package:flutter/material.dart';

import 'package:meer/components/search/search.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('MEER'),
      ),
      body: new Column(
        children: <Widget>[
          new Container(
            child: Search(), //search bar
          ),
          // new Container(
          //   child: Search(), //list of pairs
          // ),
        ],
      ),
    );
  }
}
