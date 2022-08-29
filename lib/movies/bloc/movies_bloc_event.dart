part of 'movies_bloc.dart';

@immutable
abstract class MoviesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class MovieListFetched extends MoviesEvent {}

class MovieListLoadedFromDb extends MoviesEvent {}
