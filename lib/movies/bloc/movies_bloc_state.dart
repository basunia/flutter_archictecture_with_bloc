part of 'movies_bloc.dart';

enum MovieStatus { initial, loading, success, failure }

class MoviesBlocState extends Equatable {
  const MoviesBlocState(
      {this.status = MovieStatus.initial,
      this.movies = const [],
      this.hasReachedMax = false,
      this.pageNumber = 0});
  final List<Movie> movies;
  final MovieStatus status;
  final bool hasReachedMax;
  final int pageNumber;

  MoviesBlocState copyWith(
      {MovieStatus? status,
      List<Movie>? movies,
      bool? hasReachedMax,
      int? pageNumber}) {
    return MoviesBlocState(
        status: status ?? this.status,
        movies: movies ?? this.movies,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        pageNumber: pageNumber ?? this.pageNumber);
  }

  @override
  List<Object> get props => [status, movies, hasReachedMax];
}
