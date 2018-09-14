import 'package:flutter/material.dart';
import 'package:meer/API/the_movie_db.dart';
import 'package:meer/models/movie.dart';

class SpecificPairScreen extends StatefulWidget {
  final String searchTerm;

  SpecificPairScreen({Key key, @required this.searchTerm}) : super(key: key);

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
        body: Center(
          child: FutureBuilder<Result>(
              future: fetchResult(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print('snapshot has data');
                  return Text("${snapshot.data.results[0].id.toString()}");
                } else if (snapshot.hasError) {
                  // return Text("${snapshot.error}");
                }

                return CircularProgressIndicator();
              }),
        )
        // body: new Center(
        //   child: new Text('test'),
        // ),
        );
  }
}
