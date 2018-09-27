class Movie {
  final int vote_count;
  final int id;
  final bool video;
  final dynamic vote_average;
  final String title;
  final double popularity;
  final String poster_path;
  final String original_language;
  final String original_title;
  final List<dynamic> genre_ids;
  final String backdrop_path;
  final bool adult;
  final String overview;
  final String release_date;

  Movie(
      {this.vote_count,
      this.id,
      this.video,
      this.vote_average,
      this.title,
      this.popularity,
      this.poster_path,
      this.original_language,
      this.original_title,
      this.genre_ids,
      this.backdrop_path,
      this.adult,
      this.overview,
      this.release_date});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        vote_count: json['vote_count'],
        id: json['id'],
        video: json['video'],
        vote_average: json['vote_average'],
        title: json['title'],
        popularity: json['popularity'],
        poster_path: json['poster_path'],
        original_language: json['original_language'],
        original_title: json['original_title'],
        genre_ids: json['genre_ids'],
        backdrop_path: json['backdrop_path'],
        adult: json['adult'],
        overview: json['overview'],
        release_date: json['release_date']);
  }
}

class MovieList {
  final List<Movie> movie;

  MovieList({
    this.movie,
  });

  factory MovieList.fromJson(List<dynamic> json) {
    List<Movie> movie = new List<Movie>();
    movie = json.map((i) => Movie.fromJson(i)).toList();

    return new MovieList(movie: movie);
  }
}

Map<String, dynamic> genre = {
  "12": "Adventure",
  "28": "Action",
  "16": "Animation",
  "35": "Comedy",
  "80": "Crime",
  "99": "Documentary",
  "18": "Drama",
  "10751": "Family",
  "14": "Fantasy",
  "36": "History",
  "27": "Horror",
  "10402": "Music",
  "9648": "Mystery",
  "10749": "Romance",
  "878": "Science Fiction",
  "10770": "TV Movie",
  "53": "Thriller",
  "10752": "War",
  "37": "Western"
};
  