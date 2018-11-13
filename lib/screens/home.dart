import 'package:flutter/material.dart';
import 'package:meer/widgets/search.dart';
import 'package:meer/widgets/preview.dart';
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
          Center(
              child: Container(
                  width: 150.0,
                  height: 150.0,
                  child: Image.asset("assets/logo.png", fit: BoxFit.fill))),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Search(), //search bar
          ),
          Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                  "Sunt in eiusmod nisi in veniam magna Lorem consectetur nulla aute enim non. Lorem nisi laboris ut sunt proident sunt pariatur ut excepteur duis. Enim ad cupidatat eiusmod pariatur adipisicing reprehenderit do non.")),
          new Divider(),
          new Preview(),
        ],
      ),
    );
  }
}
