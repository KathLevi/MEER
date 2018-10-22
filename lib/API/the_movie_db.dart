import 'dart:async';
import 'dart:convert';
import 'package:meer/models/movie.dart';

import 'package:http/http.dart' as http;

Future<MovieList> fetchResult(searchTerm) async {
  final response = await http.get(
      'https://api.themoviedb.org/3/search/movie?api_key=c2e77ee03e948895297a61e354780a8e&language=en-US&query=${searchTerm}&page=1&include_adult=false');

  if (response.statusCode == 200) {
    Map<String, dynamic> results = json.decode(response.body);
    MovieList movieArr = MovieList.fromJson(results['results']);
    return movieArr;
  } else {
    throw Exception('Failed to load movie');
  }
}