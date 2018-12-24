import 'package:flutter/material.dart';
import 'package:meer/API/the_movie_db.dart';
import 'package:meer/models/movie.dart';
import 'package:meer/screens/preview_results.dart';

class Preview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchPreview(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final MovieList movieList = snapshot.data;
          return Container(
              height: 220.00,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movieList.movie.length,
                  itemBuilder: (context, index) {
                    var movie = movieList.movie[index];
                    return GestureDetector(
                        onLongPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ResultsScreen(movie: movie)));
                        },
                        child: Container(
                            child: Image.network(
                                'https://image.tmdb.org/t/p/w185_and_h278_bestv2/' +
                                    movie.posterPath)));
                    // child: Text(movieList.movie[index].title));
                  }));
        }
        return LinearProgressIndicator();
      },
    );
  }
}
