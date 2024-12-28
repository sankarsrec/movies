import 'package:movies/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  int id;
  String url;
  String imdbCode;
  String title;
  String titleEnglish;
  String titleLong;
  String slug;
  int year;
  double rating;
  int runtime;
  List<String> genres;
  String summary;
  String descriptionFull;
  String synopsis;
  String language;
  String backgroundImage;
  String backgroundImageOriginal;

  MovieModel({
    required this.id,
    required this.url,
    required this.imdbCode,
    required this.title,
    required this.titleEnglish,
    required this.titleLong,
    required this.slug,
    required this.year,
    required this.rating,
    required this.runtime,
    required this.genres,
    required this.summary,
    required this.descriptionFull,
    required this.synopsis,
    required this.language,
    required this.backgroundImage,
    required this.backgroundImageOriginal,
  }) : super(
          name: title,
          image: backgroundImageOriginal,
          genresList: genres,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json['id'],
        url: json['url'],
        imdbCode: json['imdb_code'],
        title: json['title'],
        titleEnglish: json['title_english'],
        titleLong: json['title_long'],
        slug: json['slug'],
        year: json['year'],
        rating: json['rating']?.toDouble(),
        runtime: json['runtime'],
        genres: List<String>.from(json['genres'].map((x) => x)),
        summary: json['summary'],
        descriptionFull: json['description_full'],
        synopsis: json['synopsis'],
        language: json['language'],
        backgroundImage: json['background_image'],
        backgroundImageOriginal: json['background_image_original'],
      );
}
