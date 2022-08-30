part of 'movie_detail_bloc.dart';

abstract class MovieDetailEvent extends Equatable {
  abstract final String movieId;
  @override
  List<Object> get props => [];
}

class MovieDetailSubscriptionRequested extends MovieDetailEvent {
  MovieDetailSubscriptionRequested({required this.movieId});
  @override
  final String movieId;
}

class MovieDetailFetched extends MovieDetailEvent {
  MovieDetailFetched({required this.movieId});
  @override
  final String movieId;
}
