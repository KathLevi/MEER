class Movie {
  final int voteCount;
  final int id;
  final bool video;
  final dynamic voteAverage;
  final String title;
  final double popularity;
  final String posterPath;
  final String originalLanguage;
  final String originalTitle;
  final List<dynamic> genreIds;
  final String backdropPath;
  final bool adult;
  final String overview;
  final String releaseDate;

  Movie({
      this.voteCount,
      this.id,
      this.video,
      this.voteAverage,
      this.title,
      this.popularity,
      this.posterPath,
      this.originalLanguage,
      this.originalTitle,
      this.genreIds,
      this.backdropPath,
      this.adult,
      this.overview,
      this.releaseDate
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        voteCount: json['vote_count'],
        id: json['id'],
        video: json['video'],
        voteAverage: json['vote_average'],
        title: json['title'],
        popularity: json['popularity'],
        posterPath: json['poster_path'],
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        genreIds: json['genre_ids'],
        backdropPath: json['backdrop_path'],
        adult: json['adult'],
        overview: json['overview'],
        releaseDate: json['release_date']);
  }
}

class MovieList {
  final List<Movie> movie;

  MovieList({
    this.movie,
  });

  factory MovieList.fromJson(List<dynamic> json) {
    List<Movie> movie = List<Movie>();
    movie = json.map((i) => Movie.fromJson(i)).toList();

    return MovieList(movie: movie);
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
  