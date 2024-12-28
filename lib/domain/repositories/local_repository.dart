import '../entities/movie_entity.dart';

abstract class LocalRepository {
  const LocalRepository();

  Future<void> setAccessToken({
    required String? token,
  });

  String? getAccessToken();

  Future<void> setFavoriteMovies({
    required List<MovieEntity> favoriteMovies,
  });

  List<MovieEntity> getFavoriteMovies();

  Future<void> eraseStorage();
}
