import 'package:flutter/material.dart';

import 'package:meer/components/home/home.dart';
import 'package:meer/components/pairs/specific_pairs.dart';
import 'package:meer/components/info/info.dart';
import 'package:meer/models/info_spec.dart';
import 'package:meer/models/movie.dart';

import 'package:meer/components/swiping/swiping.dart';

final List<Movie> movieList = <Movie>[
  Movie(title: "Avengers"),
  Movie(title: "Princess Bride"),
  Movie(title: "Avatar"),
  Movie(title: "Inception")
];

final routes = {
  '/': (BuildContext context) => new HomeScreen(),
  // '/pairs': (BuildContext context) => new SpecificPairScreen(),
  // '/': (BuildContext context) => new InfoScreen(movie: testMovie, alcohol: testAlcohol,),
  // '/': (BuildContext context) => new InfoScreen(movie: testMovie, beer: testAlcohol,),
  // '/': (BuildContext context) => new SwipeScreen(movieList: movieList)
};
