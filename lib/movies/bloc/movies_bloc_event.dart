part of 'movies_bloc.dart';

@immutable
abstract class MoviesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class MovieListFetched extends MoviesEvent {
  MovieListFetched({this.isOnStartUp = false});
  final bool isOnStartUp;
}

class MovieListSubscriptionRequested extends MoviesEvent {}
