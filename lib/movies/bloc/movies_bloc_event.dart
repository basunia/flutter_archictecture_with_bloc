part of 'movies_bloc.dart';

@immutable
abstract class MoviesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

enum MovieFetchType { startup, pagination, refresh }

class MovieListFetched extends MoviesEvent {
  MovieListFetched({this.movieFetchType = MovieFetchType.startup});
  final MovieFetchType movieFetchType;
}

class MovieListSubscriptionRequested extends MoviesEvent {}
