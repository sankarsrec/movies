import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/movie_entity.dart';
import '../../../../domain/use_cases/movies/get_movies_use_case.dart';
import '../../../../utils/app_enums.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit({
    required this.getMoviesUseCase,
  }) : super(
          const MoviesState(),
        );

  final GetMoviesUseCase getMoviesUseCase;

  Future<void> getAllMovies({
    bool isLoadNextPage = false,
  }) async {
    if (!isLoadNextPage) {
      emit(
        state.copyWith(
          currentPage: 1,
          allMovies: [],
          fetchMoviesStatus: ApiStatus.loading,
          errorMessage: '',
        ),
      );
    }

    final moviesListEither = await getMoviesUseCase.getMovies(
      page: state.currentPage,
    );

    moviesListEither.fold(
      (failure) => emit(
        state.copyWith(
          fetchMoviesStatus: ApiStatus.loading,
        ),
      ),
      (success) {
        List<MovieEntity> allMovies = [];
        if (isLoadNextPage) {
          allMovies = List.from(state.allMovies);
          allMovies.addAll(success);
        } else {
          allMovies = success;
        }

        emit(
          state.copyWith(
            fetchMoviesStatus: ApiStatus.success,
            allMovies: allMovies,
            currentPage: state.currentPage + 1,
          ),
        );
      },
    );
  }
}
