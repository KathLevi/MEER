import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meer/models/beer.dart';

Future fetchBeerResult(rating) async {
  int abv = 20 - rating * 2;
  final response =
      await http.get('https://api.punkapi.com/v2/beers?abv_gt=${abv}');

  if (response.statusCode == 200) {
    BeerList results = BeerList.fromJson(json.decode(response.body));
    Beer something = results.beer[0];
    return something;
  } else {
    print(response.statusCode);
  }
}
