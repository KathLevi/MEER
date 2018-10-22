import 'package:flutter/material.dart';
import 'package:meer/widgets/search.dart';
import '../adaptive.dart';

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
      appBar: PlatformAdaptiveAppBar(
        title: Text('MEER'),
        platform: Theme.of(context).platform,
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
