import 'package:flutter/material.dart';
import 'package:meer/models/movie.dart';
import 'package:meer/models/beer.dart';
import 'package:meer/API/the_beer_db.dart';

class InfoScreen extends StatefulWidget {
  final Movie movie;
  final Beer beer;

  InfoScreen({Key key, @required this.movie, @required this.beer})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new InfoScreenState();
  }
}

class InfoScreenState extends State<InfoScreen> {
  Movie movie;
  Beer beer;

  @override
  void initState() {
    movie = widget.movie;
    beer = widget.beer;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(movie.title + ' pairing'),
      ),
      body: Center(
        child: FutureBuilder(
          future: fetchBeerResult(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Info(movie, snapshot.data);
            } else if (snapshot.hasError) {
              return Text(snapshot.error);
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

class Info extends StatelessWidget {
  final Movie movie;
  final Beer beer;

  Info(this.movie, this.beer);

  @override
  Widget build(BuildContext context) {
    var movieRow = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 150.0,
          child: Image.network('https://i.imgur.com/vmCWjuV.png',
              fit: BoxFit.fill),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  movie.title,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                  child: Text('Genre: ' + movie.genre_ids.toString()),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                  child: Text('Rating: ' + movie.vote_average.toString()),
                ),
              ],
            ),
          ),
        ),
      ],
    );
    var movieDescRow = Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: new Column(
              children: <Widget>[new Text(movie.overview)],
            ),
          ),
        ],
      ),
    );
    var topChoice = Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Text(
            'Top Choice: Beer',
            style: TextStyle(
                fontSize: 30.0, fontWeight: FontWeight.bold, color: Colors.red),
          ),
        )
      ],
    );
    var alcoholRow = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                beer.name,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                child: Text("ABV: " + beer.abv.toString() + '%'),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                child: Text("Tagline: " + beer.tagline),
              ),
            ],
          ),
        ),
        Container(
          width: 150.0,
          height: 200.0,
          child: Image.network(beer.imageUrl,
              fit: BoxFit.fitHeight),
        ),
      ],
    );
    return new Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          movieRow,
          movieDescRow,
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          topChoice,
          alcoholRow,
        ],
      ),
    );
  }
}
