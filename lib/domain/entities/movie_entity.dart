import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  const MovieEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.genresList,
  });

  final int id;
  final String name;
  final String image;
  final List<String> genresList;

  factory MovieEntity.fromJson(Map<String, dynamic> json) => MovieEntity(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        genresList: json[' genresList'] ?? [],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'genresList': genresList,
      };

  @override
  List<Object?> get props => [
        id,
        name,
        image,
        genresList,
      ];
}
