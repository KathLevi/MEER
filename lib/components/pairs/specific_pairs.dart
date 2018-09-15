import 'package:flutter/material.dart';
import 'package:meer/API/the_movie_db.dart';

class SpecificPairScreen extends StatefulWidget {
  final String searchTerm;

  SpecificPairScreen({Key key, @required this.searchTerm}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new SpecificPairScreenState();
  }
}

class SpecificPairScreenState extends State<SpecificPairScreen> {
  String searchTerm = "";

  @override
  void initState() {
    searchTerm = widget.searchTerm;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('MEER'),
        ),
        body: Center(
          child: FutureBuilder(
            future: fetchResult(this.searchTerm),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Pairs(snapshot.data);
              } else if (snapshot.hasError) {
                return Text(snapshot.error);
              }

              return CircularProgressIndicator();
            },
          ),
        ));
  }
}

class Pairs extends StatelessWidget {
  final List<dynamic> pairs;

  Pairs(this.pairs);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: pairs
            .map((movie) => Card(child: Text("${movie['title']}")))
            .toList());
  }
}
