import 'package:flutter/material.dart';
import 'package:meer/models/movie.dart';
import 'package:meer/API/the_beer_db.dart';

class InfoScreen extends StatefulWidget {
  final Movie movie;
  final Function(String) callback;

  InfoScreen({Key key, @required this.movie, this.callback}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return InfoScreenState();
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

  Widget _info(movie, beer) {
    String posterUri = '';
    String genres = '';
    String food = '';

    void _loop() {
      for (var i = 0; i < movie.genreIds.length; i++) {
        String asdfgl = movie.genreIds[i].toString();
        genres += genre[asdfgl] + "\n";
      }

      for (var i = 0; i < beer.foodPairing.length; i++) {
        food += beer.foodPairing[i].toString() + "\n";
      }
    }

    void checkMovieImg() {
      // OR
      posterUri = (movie.posterPath == null)
          ? "https://www.lawlorscustom.com/content/images/thumbs/default-image_450.png"
          : "https://image.tmdb.org/t/p/w185_and_h278_bestv2/" +
              movie.posterPath;
    }

    _loop();
    checkMovieImg();

    Widget _movie() {
      return Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 150.0,
                child: Image.network(posterUri, fit: BoxFit.fill),
              ),
              Container(
                child: Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          movie.title,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                            'Genre: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(genres),
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 5.0),
                              child: Text('Rating:',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Text(movie.voteAverage.toString()),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Flexible(
                  child: Column(
                    children: <Widget>[Text(movie.overview)],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget _alcohol() {
      return Column(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    beer.name,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                    child: Text(
                      beer.tagline,
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 10.0, top: 10.0, right: 5.0),
                        child: Text(
                          "ABV: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(beer.abv.toString() + '%'),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                    child: Text(
                      "Food Pairing: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0, left: 10.0),
                    child: Text(food),
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
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Flexible(
                child: Column(
                  children: <Widget>[Text(beer.description)],
                ),
              ),
            ],
          ),
        )
      ]);
    }

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: _movie(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                Icons.navigate_before,
                size: 30.0,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () => widget.callback("back"),
            ),
            IconButton(
              icon: Icon(
                Icons.navigate_next,
                size: 30.0,
                color: Theme.of(context).accentColor,
              ),
              onPressed: () => widget.callback("next"),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: _alcohol(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    round = movie.voteAverage.toStringAsFixed(0);
    rating = int.parse(round);
    return Center(
      child: FutureBuilder(
        future: fetchBeerResult(this.rating),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _info(movie, snapshot.data);
          } else if (snapshot.hasError) {
            return Text(snapshot.error);
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
