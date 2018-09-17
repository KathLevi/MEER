import 'package:flutter/material.dart';
import 'package:meer/models/info_spec.dart';

class InfoScreen extends StatefulWidget {
  final Movie movie;
  final Alcohol alcohol;

  InfoScreen({Key key, @required this.movie, @required this.alcohol})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new InfoScreenState();
  }
}

class InfoScreenState extends State<InfoScreen> {
  Movie movie;
  Alcohol alcohol;

  @override
  void initState() {
    movie = widget.movie;
    alcohol = widget.alcohol;
    super.initState();
  }

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
                  movie.name,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                  child: Text('Genre: ' + movie.genre),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                  child: Text('Rating: ' + movie.rating.toString()),
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
              children: <Widget>[new Text(movie.description)],
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
            'Top Choice: ' + alcohol.type,
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
                alcohol.name,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                child: Text("ABV: " + alcohol.abv.toString() + '%'),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                child: Text("Brand: " + alcohol.brand),
              ),
            ],
          ),
        ),
        Container(
          width: 150.0,
          child: Image.network('https://i.imgur.com/vmCWjuV.png',
              fit: BoxFit.fill),
        ),
      ],
    );
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(movie.name + ' pairing'),
      ),
      body: Padding(
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
      ),
    );
  }
}
