import 'package:flutter/material.dart';
import 'package:meer/models/movie.dart';
import 'package:meer/models/beer.dart';
import 'package:meer/API/the_beer_db.dart';

class InfoScreen extends StatefulWidget {
  final Movie movie;

  InfoScreen({Key key, @required this.movie}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new InfoScreenState();
  }
}

class InfoScreenState extends State<InfoScreen> {
  Movie movie;
  var round;
  int rating;

  @override
  void initState() {
    movie = widget.movie;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    round = movie.vote_average.toStringAsFixed(0);
    rating = int.parse(round);
    return Center(
      child: FutureBuilder(
        future: fetchBeerResult(this.rating),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Info(movie, snapshot.data);
          } else if (snapshot.hasError) {
            return Text(snapshot.error);
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

class Info extends StatelessWidget {
  final Movie movie;
  final Beer beer;
  final String uri = "https://image.tmdb.org/t/p/w185_and_h278_bestv2/";
  String genres = '';

  Info(this.movie, this.beer);

  void _loop() {
    for (var i = 0; i < movie.genre_ids.length; i++) {
      String asdfgl = movie.genre_ids[i].toString();
      genres += genre[asdfgl] + "\n";
    }
  }

  @override
  Widget build(BuildContext context) {
    this._loop();
    var movieRow = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 150.0,
          child: Image.network(uri + movie.poster_path, fit: BoxFit.fill),
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
                  child: Text('Genre: ' + genres),
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
          child: Image.network(beer.imageUrl, fit: BoxFit.fitHeight),
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
