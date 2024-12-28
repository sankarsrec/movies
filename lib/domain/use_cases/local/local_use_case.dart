import '../../entities/movie_entity.dart';
import '../../repositories/local_repository.dart';

class LocalUseCase {
  const LocalUseCase({
    required this.localRepository,
  });

  final LocalRepository localRepository;

  Future<void> setAccessToken({
    required String? token,
  }) async {
    await localRepository.setAccessToken(
      token: token,
    );
  }

  String? getAccessToken() {
    return localRepository.getAccessToken();
  }

  Future<void> setFavoriteMovies({
    required List<MovieEntity> favoriteMovies,
  }) async {
    await localRepository.setFavoriteMovies(
      favoriteMovies: favoriteMovies,
    );
  }

  List<MovieEntity> getFavoriteMovies() {
    return localRepository.getFavoriteMovies();
  }

  Future<void> eraseStorage() async {
    await localRepository.eraseStorage();
  }
}
