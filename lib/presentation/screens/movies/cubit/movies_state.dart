part of 'movies_cubit.dart';

class MoviesState extends Equatable {
  const MoviesState({
    this.fetchMoviesStatus = ApiStatus.idle,
    this.errorMessage = '',
    this.allMovies = const [],
    this.currentPage = 1,
    this.isSearch = false,
    this.searchedMovies = const [],
    this.favoriteMovies = const [],
  });

  final ApiStatus fetchMoviesStatus;
  final String errorMessage;
  final List<MovieEntity> allMovies;
  final int currentPage;
  final bool isSearch;
  final List<MovieEntity> searchedMovies;
  final List<MovieEntity> favoriteMovies;

  MoviesState copyWith({
    ApiStatus? fetchMoviesStatus,
    String? errorMessage,
    List<MovieEntity>? allMovies,
    int? currentPage,
    bool? isSearch,
    List<MovieEntity>? searchedMovies,
    List<MovieEntity>? favoriteMovies,
  }) {
    return MoviesState(
      fetchMoviesStatus: fetchMoviesStatus ?? ApiStatus.idle,
      errorMessage: errorMessage ?? this.errorMessage,
      allMovies: allMovies ?? this.allMovies,
      currentPage: currentPage ?? this.currentPage,
      isSearch: isSearch ?? this.isSearch,
      searchedMovies: searchedMovies ?? this.searchedMovies,
      favoriteMovies: favoriteMovies ?? this.favoriteMovies,
    );
  }

  bool get isLoading => fetchMoviesStatus == ApiStatus.loading;

  @override
  List<Object?> get props => [
        fetchMoviesStatus,
        errorMessage,
        allMovies,
        currentPage,
        isSearch,
        searchedMovies,
        favoriteMovies,
      ];
}
