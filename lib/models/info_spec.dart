class Movie {
  const Movie(
      {this.name, this.image, this.description, this.genre, this.rating});

  final String name;
  final String image;
  final String description;
  final String genre;
  final double rating;
}

class Alcohol {
  const Alcohol({this.name, this.abv, this.brand, this.image, this.type});

  final String name;
  final double abv;
  final String brand;
  final String image;
  final String type;
}

// Test data

const Movie movie = Movie(
    name: 'Avengers',
    image: 'assets/something.png',
    description:
        'Some movie about some people doing something to someone using something.',
    rating: 8.0,
    genre: 'action');

const Alcohol alcohol = Alcohol(
    name: 'Space Dust',
    abv: 8.2,
    brand: 'Elysian Brewing Company',
    image: 'assets/spacedust.png',
    type: 'Beer');
