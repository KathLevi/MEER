import 'package:flutter/material.dart';
import 'package:meer/widgets/info.dart';
import 'package:meer/models/movie.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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
  List<Widget> swipingArray() {
    var pairs = [];
    for (var i = 0; i < _movieList.movie.length; i++) {
      pairs.add(InfoScreen(movie: _movieList.movie[i], callback: callback));
    }

    return pairs;
  }

  @override
  void initState() {
    _movieList = widget.movieList;

    super.initState();
  }

  callback(newSwipe) {
    setState(() {
      if (newSwipe == "next") {
        if (counter >= _movieList.movie.length - 1) {
          counter = 0;
        } else {
          counter++;
        }
      } else if (newSwipe == "back") {
        if (counter <= 0) {
          counter = _movieList.movie.length - 1;
        } else {
          counter--;
        }
      }
      swipeCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return new ListView(children: <Widget>[
          InfoScreen(movie: _movieList.movie[index], callback: callback)
        ]);
      },
      autoplay: false,
      itemCount: _movieList.movie.length,
    );
  }
}
