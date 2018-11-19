import 'package:flutter/material.dart';
import 'package:meer/widgets/swiping.dart';
import 'package:meer/models/movie.dart';
import '../adaptive.dart';

class ResultsScreen extends StatefulWidget {
  final String searchTerm;

  ResultsScreen({Key key, @required this.searchTerm}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ResultsScreenState();
  }
}

class ResultsScreenState extends State<ResultsScreen> {
  String searchTerm = "";
  final MovieList movieList = MovieList();

  @override
  void initState() {
    searchTerm = widget.searchTerm;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PlatformAdaptiveAppBar(
          title: Text("Results"),
          platform: Theme.of(context).platform,
        ),
        body: Center(
          child: FutureBuilder(
            future: fetchResult(this.searchTerm),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SwiperNoSwiping(movieList: snapshot.data);
              } else if (snapshot.hasError) {
                return Text(snapshot.error);
              }
              return CircularProgressIndicator();
            },
          ),
        ));
  }
}
