import 'package:dartz/dartz.dart';

import '../../domain/entities/movie_entity.dart';
import '../../domain/entities/server_error_entity.dart';
import '../../domain/repositories/movies_repository.dart';
import '../data_sources/remote/movies_remote_data_source.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  const MoviesRepositoryImpl({
    required this.moviesDataSource,
  });

  final MoviesRemoteDataSource moviesDataSource;

  @override
  Future<Either<ServerErrorEntity, List<MovieEntity>>> getMovies({
    required int page,
  }) async {
    return moviesDataSource.getMovies(
      page: page,
    );
  }
}
