import 'package:flutter/material.dart';
import 'package:meer/components/info/info.dart';
import 'package:meer/models/movie.dart';

class SwipeScreen extends StatefulWidget {
  final MovieList movieList;

  SwipeScreen({Key key, @required this.movieList}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new SwipeScreenState();
  }
}

class SwipeScreenState extends State<SwipeScreen> {
  MovieList movieList;
  int counter = 0;

  @override
  void initState() {
    movieList = widget.movieList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Dismissible(
      key: new ValueKey(counter),
      onDismissed: (direction) {
        var modifier = 0;
        print(direction);
        if (direction == DismissDirection.endToStart) {
          modifier = 1;
        } else {
          modifier = -1;
        }
        var res = counter + modifier;
        if (res < 0) {
          res = 0;
        } else if (res >= movieList.movie.length) {
          res = movieList.movie.length - 1;
        }
        setState(() {
          print('setting state' + res.toString());
          counter = res;
        });
      },
      child: ListView(children: [InfoScreen(movie: movieList.movie[counter])]),
    );
  }
}
