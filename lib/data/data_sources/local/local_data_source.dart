import 'package:movies/domain/entities/movie_entity.dart';

import '../../core/local_storage.dart';

abstract class LocalDataSource {
  const LocalDataSource();

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

class LocalDataSourceImpl extends LocalDataSource {
  const LocalDataSourceImpl({
    required this.localStorage,
  });

  final LocalStorage localStorage;

  @override
  Future<void> setAccessToken({
    required String? token,
  }) async {
    await localStorage.saveToStorage(
      LocalStorageConstants.accessToken,
      token,
    );
  }

  @override
  String? getAccessToken() {
    final response = localStorage.readFromStorage(
      LocalStorageConstants.accessToken,
    );
    return response;
  }

  @override
  Future<void> setFavoriteMovies({
    required List<MovieEntity> favoriteMovies,
  }) async {
    await localStorage.saveToStorage(
      LocalStorageConstants.favoriteMovies,
      List<dynamic>.from(favoriteMovies.map((x) => x.toJson())),
    );
  }

  @override
  List<MovieEntity> getFavoriteMovies() {
    final response = localStorage.readFromStorage(
      LocalStorageConstants.favoriteMovies,
    );

    if (response != null) {
      return List<MovieEntity>.from(
        response.map(
          (x) => MovieEntity.fromJson(x),
        ),
      );
    }

    return response ?? [];
  }

  @override
  Future<void> eraseStorage() async {
    await localStorage.eraseStorage();
  }
}
