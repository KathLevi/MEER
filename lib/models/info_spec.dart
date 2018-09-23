import 'package:meer/models/movie.dart';
import 'package:meer/models/beer.dart';

// Test data
Movie testMovie = Movie(
    title: 'Avengers',
    poster_path: 'assets/something.png',
    overview:
        'Some movie about some people doing something to someone using something.',
    vote_average: 8.0,
    genre_ids: [1, 2]);

Beer testAlcohol = Beer(
    id: 192,
    name: "Space Dust",
    abv: 8.2,
    tagline: "Post Modern Classic. Spiky. Tropical. Hoppy.",
    firstBrewed: "04/2007",
    description:
        "Our flagship beer that kick started the craft beer revolution. This is James and Martin's original take on an American IPA, subverted with punchy New Zealand hops. Layered with new world hops to create an all-out riot of grapefruit, pineapple and lychee before a spiky, mouth-puckering bitter finish.",
    imageUrl: "assets/spacedust.png",
    brewersTips:
        "While it may surprise you, this version of Punk IPA isn't dry hopped but still packs a punch! To make the best of the aroma hops make sure they are fully submerged and add them just before knock out for an intense hop hit.");
