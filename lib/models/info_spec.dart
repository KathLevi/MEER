import 'package:meer/models/movie.dart';

class Alcohol {
  const Alcohol({this.name, this.abv, this.brand, this.image, this.type});

  final String name;
  final double abv;
  final String brand;
  final String image;
  final String type;
}

// Test data

Movie movie = Movie(
    title: 'Avengers',
    poster_path: 'assets/something.png',
    overview:
        'Some movie about some people doing something to someone using something.',
    vote_average: 8.0,
    genre_ids: [1, 2]);

const Alcohol alcohol = Alcohol(
    name: 'Space Dust',
    abv: 8.2,
    brand: 'Elysian Brewing Company',
    image: 'assets/spacedust.png',
    type: 'Beer');
