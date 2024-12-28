import 'movie_model.dart';

class MoviesDataModel {
  int movieCount;
  int limit;
  int pageNumber;
  List<MovieModel> movies;

  MoviesDataModel({
    required this.movieCount,
    required this.limit,
    required this.pageNumber,
    required this.movies,
  });

  factory MoviesDataModel.fromJson(Map<String, dynamic> json) =>
      MoviesDataModel(
        movieCount: json['movie_count'],
        limit: json['limit'],
        pageNumber: json['page_number'],
        movies: List<MovieModel>.from(
            json['movies'].map((x) => MovieModel.fromJson(x))),
      );
}
