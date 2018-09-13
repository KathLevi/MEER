import 'package:flutter/material.dart';


class SpecificPairScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SpecificPairScreenState();
  }
}

class SpecificPairScreenState extends State<SpecificPairScreen> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('MEER'),
      ),
      body: new Center(
        child: new Text('specific pairs'),
      ),
    );
  }
}