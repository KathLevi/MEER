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
  int swipeCounter = 0;
  int counter = 0;

  @override
  void initState() {
    movieList = widget.movieList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Dismissible(
      key: new ValueKey(swipeCounter),
      background: Container(color: Colors.purple),
      onDismissed: (direction) {
        var newCounter = 0;
        switch (direction) {
          case DismissDirection.endToStart:
            if (counter >= movieList.movie.length - 1) {
              newCounter = 0;
              break;
            }
            newCounter = counter + 1;
            break;
          case DismissDirection.startToEnd:
            if (counter <= 0) {
              newCounter = movieList.movie.length - 1;
              break;
            }
            newCounter = counter - 1;
            break;
          case DismissDirection.up:
            break;
          case DismissDirection.down:
            break;
          case DismissDirection.vertical:
            break;
          case DismissDirection.horizontal:
            break;
        }

        setState(() {
          counter = newCounter;
          swipeCounter++;
        });
      },
      child: ListView(children: [InfoScreen(movie: movieList.movie[counter])]),
    );
  }
}
