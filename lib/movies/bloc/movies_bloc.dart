import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_repository/movie_repository.dart';

part 'movies_bloc_event.dart';
part 'movies_bloc_state.dart';

class MoviesBloc extends Bloc<MovieListFetched, MoviesBlocState> {
  MoviesBloc({required MovieRepository movieRepository})
      : _movieRepository = movieRepository,
        super(MoviesBlocInitial()) {
    on<MovieListFetched>((event, emit) {});
  }
  final MovieRepository _movieRepository;
}
