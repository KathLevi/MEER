import 'package:flutter/material.dart';
import 'package:meer/widgets/search.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MEER'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Search(), //search bar
          ),
        ],
      ),
    );
  }
}
