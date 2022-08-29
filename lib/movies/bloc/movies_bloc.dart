import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_api/model/movie.dart';
import 'package:movie_repository/movie_repository.dart';

part 'movies_bloc_event.dart';
part 'movies_bloc_state.dart';

const movieLimit = 10;

class MoviesBloc extends Bloc<MoviesEvent, MoviesBlocState> {
  MoviesBloc({required MovieRepository movieRepository})
      : _movieRepository = movieRepository,
        super(const MoviesBlocState()) {
    on<MovieListFetched>(_fetchMovies);
    // on<MovieListLoadedFromDb>(_fetchMovies);
  }
  final MovieRepository _movieRepository;

  _fetchMovies(MovieListFetched event, Emitter<MoviesBlocState> emit) async {
    emit(state.copyWith(status: MovieStatus.initial));
    try {
      await _movieRepository.fetchMovieFromApi();
      final movieStream = _movieRepository.loadMovieFromDb();
      emit.forEach(movieStream,
          onData: (List<Movie> movies) =>
              state.copyWith(status: MovieStatus.success, movies: movies),
          onError: (ob, st) => state.copyWith(status: MovieStatus.failure));
    } catch (e) {
      emit(state.copyWith(status: MovieStatus.failure));
    }
  }
}
