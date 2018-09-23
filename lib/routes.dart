import 'package:flutter/material.dart';

import 'package:meer/components/home/home.dart';
import 'package:meer/components/pairs/specific_pairs.dart';
import 'package:meer/components/info/info.dart';
import 'package:meer/models/info_spec.dart';

final routes = {
  '/home': (BuildContext context) => new HomeScreen(),
  // '/pairs': (BuildContext context) => new SpecificPairScreen(),
  // '/': (BuildContext context) => new InfoScreen(movie: testMovie, alcohol: testAlcohol,),
  '/': (BuildContext context) => new InfoScreen(movie: testMovie, beer: testAlcohol,),
};
