import 'package:flutter/material.dart';
import 'package:meer/API/the_movie_db.dart';
import 'package:meer/components/info/info.dart';
import 'package:meer/components/swiping/swiping.dart';
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
  String searchTerm = "";
  final MovieList movieList = new MovieList();

  @override
  void initState() {
    searchTerm = widget.searchTerm;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text ("Results"),
        ),
        body: Center(
          child: FutureBuilder(
            future: fetchResult(this.searchTerm),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SwipeScreen(movieList: snapshot.data);
              } else if (snapshot.hasError) {
                return Text(snapshot.error);
              }
              return CircularProgressIndicator();
            },
          ),
        ));
  }
}
