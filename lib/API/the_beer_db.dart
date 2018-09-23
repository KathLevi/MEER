import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meer/models/beer.dart';
import 'package:meer/models/info_spec.dart';

Future fetchBeerResult() async {
  int abv = 6;
  final response = await http.get('https://api.punkapi.com/v2/beers?abv_gt=${abv}');

  if (response.statusCode == 200) {
    print(response.body);
    BeerList results = BeerList.fromJson(json.decode(response.body));
    Beer something = results.beer[0];
    return something;
  }
}
