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
          title: new Text('Results'),
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
    return ListView(
        children: pairs
            .map((movie) => Card(
                    child: Row(
                  children: <Widget>[
                    Expanded(child: this.movie(movie)),
                    Expanded(
                        child: Card(
                            child: Image.network(
                                'https://i.imgur.com/vmCWjuV.png',
                                fit: BoxFit.fill))),
                    Expanded(
                        child: Text(
                            'Nostrud aliquip amet in ex ad deserunt laborum voluptate aute ea.'))
                  ],
                )))
            .toList());
  }

  movie(movie) {
    final String imgWidth = "185";
    final String imgHeight = "278";
    final String uri =
        "https://image.tmdb.org/t/p/w${imgWidth}_and_h${imgHeight}_bestv2/";

    if (movie['poster_path'] is String) {
      return Card(child: Image.network(uri + movie['poster_path']));
    } else if (movie['title'].length is String) {
      return Text(movie['title']);
    }

    return Text('no title found');
  }
}
