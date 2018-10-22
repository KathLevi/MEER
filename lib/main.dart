import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:meer/routes.dart';
import 'adaptive.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'MEER',
       theme: defaultTargetPlatform == TargetPlatform.iOS ? kIOSTheme : kDefaultTheme,
      routes: routes,
      
    );
  }
}
