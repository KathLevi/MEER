import 'dart:async';
import 'dart:convert';
import 'package:meer/models/movie.dart';

import 'package:http/http.dart' as http;

const notAPIKey = "c2e77ee03e948895297a61e354780a8e";

Future<MovieList> fetchResult(searchTerm) async {
  final response = await http.get(
      'https://api.themoviedb.org/3/search/movie?api_key=$notAPIKey&languaggit pue=en-US&query=$searchTerm&page=1&include_adult=false');

  if (response.statusCode == 200) {
    Map<String, dynamic> results = json.decode(response.body);
    MovieList movieArr = MovieList.fromJson(results['results']);
    return movieArr;
  } else {
    print(response.statusCode);
    throw Exception('Failed to load movie');
  }
}

Future<MovieList> fetchPreview() async {
  final response = await http.get(
      'https://api.themoviedb.org/3/discover/movie?api_key=$notAPIKey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1');

  if (response.statusCode == 200) {
    Map<String, dynamic> results = json.decode(response.body);
    MovieList movieArr = MovieList.fromJson(results['results']);
    return movieArr;
  } else {
    print(response.statusCode);
    throw Exception('Failed to load movies');
  }
}
