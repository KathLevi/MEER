import 'package:flutter/material.dart';
import 'package:meer/widgets/info.dart';
import 'package:meer/models/movie.dart';

class SwiperNoSwiping extends StatefulWidget {
  final MovieList movieList;

  SwiperNoSwiping({Key key, @required this.movieList}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SwiperNoSwipingState();
  }
}

class SwiperNoSwipingState extends State<SwiperNoSwiping> {
  MovieList _movieList = MovieList();
  int swipeCounter = 0;
  int counter = 0;

  @override
  void initState() {
    _movieList = widget.movieList;
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(swipeCounter),
      background: Container(color: Colors.purple),
      onDismissed: (direction) {
        var newCounter = 0;
        switch (direction) {
          case DismissDirection.endToStart:
            if (counter >= _movieList.movie.length - 1) {
              newCounter = 0;
              break;
            }
            newCounter = counter + 1;
            break;
          case DismissDirection.startToEnd:
            if (counter <= 0) {
              newCounter = _movieList.movie.length - 1;
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
      child: ListView(children: [InfoScreen(movie: _movieList.movie[counter])]),
    );
  }
}
