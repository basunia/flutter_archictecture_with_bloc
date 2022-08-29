part of 'movies_bloc.dart';

enum MovieStatus { initial, loading, success, failure }

class MoviesBlocState extends Equatable {
  const MoviesBlocState(
      {this.status = MovieStatus.initial,
      this.movies = const [],
      this.hasReachedMax = false});
  final List<Movie> movies;
  final MovieStatus status;
  final bool hasReachedMax;

  MoviesBlocState copyWith(
      {MovieStatus? status, List<Movie>? movies, bool? hasReachedMax}) {
    return MoviesBlocState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [status, movies, hasReachedMax];
}
