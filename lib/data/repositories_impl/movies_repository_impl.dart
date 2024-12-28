import 'package:dartz/dartz.dart';
import 'package:movies/data/core/api_services.dart';

import '../../domain/entities/movie_entity.dart';
import '../../domain/entities/server_error_entity.dart';
import '../../domain/repositories/movies_repository.dart';
import '../data_sources/local/local_data_source.dart';
import '../data_sources/remote/movies_remote_data_source.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  const MoviesRepositoryImpl({
    required this.moviesDataSource,
    required this.localDataSource,
  });

  final MoviesRemoteDataSource moviesDataSource;
  final LocalDataSource localDataSource;

  @override
  Future<Either<ServerErrorEntity, List<MovieEntity>>> getMovies({
    required int page,
  }) async {
    bool isConnected = await ApiServices.checkInternetConnection();

    if (isConnected) {
      return moviesDataSource.getMovies(
        page: page,
      );
    } else {
      return Right(
        localDataSource.getFavoriteMovies(),
      );
    }
  }
}
