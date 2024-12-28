import 'package:dartz/dartz.dart';

import '../entities/movie_entity.dart';
import '../entities/server_error_entity.dart';

abstract class MoviesRepository {
  const MoviesRepository();

  Future<Either<ServerErrorEntity, List<MovieEntity>>> getMovies({
    required int page,
  });
}
