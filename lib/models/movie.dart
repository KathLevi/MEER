class Result {
  final int page;
  final int total_results;
  final int total_pages;
  final List<dynamic> results;

  Result({this.page, this.total_results, this.total_pages, this.results});

  factory Result.fromJson(Map json) {
    return Result(
        page: json['page'],
        total_results: json['total_results'],
        total_pages: json['total_pages'],
        results: json['results']);
  }
}

class Movie {
  final int vote_count;
  final int id;
  final bool video;
  final double vote_average;
  final String title;
  final double popularity;
  final String poster_path;
  final String original_language;
  final String original_title;
  final List<int> genre_ids;
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
