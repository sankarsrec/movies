import 'package:dartz/dartz.dart';

import '../../entities/movie_entity.dart';
import '../../entities/server_error_entity.dart';
import '../../repositories/movies_repository.dart';

class GetMoviesUseCase {
  const GetMoviesUseCase({
    required this.moviesRepository,
  });

  final MoviesRepository moviesRepository;

  Future<Either<ServerErrorEntity, List<MovieEntity>>> getMovies({
    required int page,
  }) async {
    return await moviesRepository.getMovies(
      page: page,
    );
  }
}
