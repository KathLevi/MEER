import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meer/models/movie.dart';

Future<Result> fetchResult() async {
  final response = await http.get(
      'https://api.themoviedb.org/3/search/movie?api_key=c2e77ee03e948895297a61e354780a8e&language=en-US&query=avengers&page=1&include_adult=true');

  if (response.statusCode == 200) {
    Result results = Result.fromJson(json.decode(response.body));
    return results;
  } else {
    throw Exception('Failed to load movie');
  }
}
