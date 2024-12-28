import 'dart:async';

import 'package:get_it/get_it.dart';

import '../data/core/api_services.dart';
import '../data/core/local_storage.dart';
import '../data/data_sources/local/local_data_source.dart';
import '../data/data_sources/remote/movies_remote_data_source.dart';
import '../data/repositories_impl/local_repository_impl.dart';
import '../data/repositories_impl/movies_repository_impl.dart';
import '../domain/repositories/local_repository.dart';
import '../domain/repositories/movies_repository.dart';
import '../domain/use_cases/local/local_use_case.dart';
import '../domain/use_cases/movies/get_movies_use_case.dart';

final getItInstance = GetIt.I;

class DependencyInjection {
  static Future initializeInjection() async {
    /// Initialize Local Storage
    LocalStorage localStorage = LocalStorage();
    await localStorage.initStorage();

    getItInstance

      /// API Service
      ..registerLazySingleton<ApiServices>(
        () => ApiServices(),
      )

      /// Local Storage
      ..registerLazySingleton<LocalStorage>(
        () => localStorage,
      )

      /// Data Sources
      ..registerLazySingleton<LocalDataSource>(
        () => LocalDataSourceImpl(
          localStorage: getItInstance<LocalStorage>(),
        ),
      )
      ..registerLazySingleton<MoviesRemoteDataSource>(
        () => MoviesRemoteDataSourceImpl(
          apiServices: getItInstance<ApiServices>(),
        ),
      )

      /// Repositories
      ..registerLazySingleton<LocalRepository>(
        () => LocalRepositoryImpl(
          localDataSource: getItInstance<LocalDataSource>(),
        ),
      )
      ..registerLazySingleton<MoviesRepository>(
        () => MoviesRepositoryImpl(
          moviesDataSource: getItInstance<MoviesRemoteDataSource>(),
          localDataSource: getItInstance<LocalDataSource>(),
        ),
      )

      /// Use Cases
      ..registerLazySingleton<LocalUseCase>(
        () => LocalUseCase(
          localRepository: getItInstance<LocalRepository>(),
        ),
      )
      ..registerLazySingleton<GetMoviesUseCase>(
        () => GetMoviesUseCase(
          moviesRepository: getItInstance<MoviesRepository>(),
        ),
      );
  }
}
