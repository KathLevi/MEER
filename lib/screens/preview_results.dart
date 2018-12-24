import 'package:flutter/material.dart';
import 'package:meer/widgets/info.dart';
import 'package:meer/models/movie.dart';
import '../adaptive.dart';

class ResultsScreen extends StatelessWidget {
  final Movie movie;

  ResultsScreen({Key key, @required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PlatformAdaptiveAppBar(
        title: Text("Results"),
        platform: Theme.of(context).platform,
      ),
      body: Center(child: ListView(children: [InfoScreen(movie: this.movie)])),
    );
  }
}
