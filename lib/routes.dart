import 'package:flutter/material.dart';

import 'package:meer/components/home/home.dart';
import 'package:meer/components/pairs/specific_pairs.dart';

final routes = {
  '/home': (BuildContext context) => new HomeScreen(),
  // '/pairs': (BuildContext context) => new SpecificPairScreen(),
  '/': (BuildContext context) => new HomeScreen(),
};
