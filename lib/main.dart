import 'package:flutter/material.dart';

import 'search/search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MEER',
      theme: new ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('MEER'),
        ),
        body: Search(),
      ),
    );
  }
}