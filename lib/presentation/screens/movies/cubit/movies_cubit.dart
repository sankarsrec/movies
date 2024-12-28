import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/use_cases/local/local_use_case.dart';

import '../../../../domain/entities/movie_entity.dart';
import '../../../../domain/use_cases/movies/get_movies_use_case.dart';
import '../../../../utils/app_enums.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit({
    required this.getMoviesUseCase,
    required this.localUseCase,
  }) : super(
          const MoviesState(),
        );

  final GetMoviesUseCase getMoviesUseCase;
  final LocalUseCase localUseCase;

  Future<void> getAllMovies({
    bool isLoadNextPage = false,
  }) async {
    try {
      if (!isLoadNextPage) {
        emit(
          state.copyWith(
            currentPage: 1,
            allMovies: [],
            fetchMoviesStatus: ApiStatus.loading,
            errorMessage: '',
            isSearch: false,
            searchedMovies: [],
          ),
        );
      }

      final moviesListEither = await getMoviesUseCase.getMovies(
        page: state.currentPage,
      );

      moviesListEither.fold(
        (failure) {
          emit(
            state.copyWith(
              fetchMoviesStatus: ApiStatus.error,
              errorMessage: failure.errorMessage,
            ),
          );
        },
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
              favoriteMovies: localUseCase.getFavoriteMovies(),
            ),
          );
        },
      );
    } catch (exception) {
      emit(
        state.copyWith(
          fetchMoviesStatus: ApiStatus.error,
          errorMessage: exception.toString(),
        ),
      );
    }
  }

  void searchMovies(String searchText) {
    if (searchText.isEmpty) {
      emit(
        state.copyWith(
          isSearch: false,
          searchedMovies: [],
        ),
      );
    } else {
      List<MovieEntity> filteredItems = state.allMovies
          .where(
            (stockTakeItem) => stockTakeItem.name
                .toLowerCase()
                .contains(searchText.toLowerCase()),
          )
          .toList();

      emit(
        state.copyWith(
          isSearch: true,
          searchedMovies: filteredItems,
        ),
      );
    }
  }

  Future<void> updateFavorite({
    required MovieEntity movieData,
  }) async {
    List<MovieEntity> currentFavorites = localUseCase.getFavoriteMovies();

    int presentIndex = currentFavorites.indexWhere(
      (element) => element.name == movieData.name,
    );

    if (presentIndex >= 0) {
      currentFavorites.remove(movieData);
    } else {
      currentFavorites.add(movieData);
    }

    await localUseCase.setFavoriteMovies(
      favoriteMovies: currentFavorites,
    );

    emit(
      state.copyWith(
        favoriteMovies: currentFavorites,
      ),
    );
  }
}
