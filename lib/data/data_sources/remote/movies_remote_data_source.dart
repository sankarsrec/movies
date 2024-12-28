import 'package:dartz/dartz.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/entities/server_error_entity.dart';
import '../../core/api_constants.dart';
import '../../core/api_services.dart';
import '../../models/movies_response_model.dart';
import '../../models/server_error_model.dart';

abstract class MoviesRemoteDataSource {
  const MoviesRemoteDataSource();

  Future<Either<ServerErrorEntity, List<MovieEntity>>> getMovies({
    required int page,
  });
}

class MoviesRemoteDataSourceImpl extends MoviesRemoteDataSource {
  const MoviesRemoteDataSourceImpl({
    required this.apiServices,
  });

  final ApiServices apiServices;

  @override
  Future<Either<ServerErrorEntity, List<MovieEntity>>> getMovies({
    required int page,
  }) async {
    final response = await apiServices.get(
      ApiConstants.movies,
      queryParameters: {
        'limit': 10,
        'page': page,
      },
    );

    if (response is ServerErrorModel) {
      return Left(response);
    } else {
      final moviesResponse = MoviesResponseModel.fromJson(
        response ?? {},
      );
      return Right(moviesResponse.data.movies);
    }
  }
}
