import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  const MovieEntity({
    required this.name,
    required this.image,
    required this.genresList,
  });

  final String name;
  final String image;
  final List<String> genresList;

  @override
  List<Object?> get props => [
        name,
        image,
        genresList,
      ];
}
