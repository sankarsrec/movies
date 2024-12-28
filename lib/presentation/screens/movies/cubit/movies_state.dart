part of 'movies_cubit.dart';

class MoviesState extends Equatable {
  const MoviesState({
    this.fetchMoviesStatus = ApiStatus.idle,
    this.errorMessage = '',
    this.allMovies = const [],
    this.currentPage = 1,
  });

  final ApiStatus fetchMoviesStatus;
  final String errorMessage;
  final List<MovieEntity> allMovies;
  final int currentPage;

  MoviesState copyWith({
    ApiStatus? fetchMoviesStatus,
    String? errorMessage,
    List<MovieEntity>? allMovies,
    int? currentPage,
  }) {
    return MoviesState(
      fetchMoviesStatus: fetchMoviesStatus ?? ApiStatus.idle,
      errorMessage: errorMessage ?? this.errorMessage,
      allMovies: allMovies ?? this.allMovies,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  bool get isLoading => fetchMoviesStatus == ApiStatus.loading;

  @override
  List<Object?> get props => [
        fetchMoviesStatus,
        errorMessage,
        allMovies,
        currentPage,
      ];
}
