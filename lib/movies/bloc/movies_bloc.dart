import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movie_api/model/movie.dart';
import 'package:movie_repository/movie_repository.dart';
import 'package:stream_transform/stream_transform.dart';

part 'movies_bloc_event.dart';
part 'movies_bloc_state.dart';

const movieLimit = 10;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class MoviesBloc extends Bloc<MoviesEvent, MoviesBlocState> {
  MoviesBloc({required MovieRepository movieRepository})
      : _movieRepository = movieRepository,
        super(const MoviesBlocState()) {
    on<MovieListFetched>(
      _fetchMovies,
      // transformer: throttleDroppable(throttleDuration),
    );
    on<MovieListSubscriptionRequested>(_onSubscriptionRequested);
  }
  final MovieRepository _movieRepository;

  _fetchMovies(MovieListFetched event, Emitter<MoviesBlocState> emit) async {
    if (state.hasReachedMax) return;
    try {
      emit(state.copyWith(
          status: state.movies.isEmpty
              ? MovieStatus.initial
              : MovieStatus.loading));
      final page = state.pageNumber + 1;
      debugPrint('Page:=======> $page');
      await _movieRepository.fetchMovieFromApi(page: page);
    } catch (e) {
      emit(state.copyWith(status: MovieStatus.failure));
    }
  }

  _onSubscriptionRequested(MovieListSubscriptionRequested event,
      Emitter<MoviesBlocState> emit) async {
    if (state.status == MovieStatus.initial) {
      await emit.forEach(_movieRepository.loadMovieFromDb(),
          onData: (List<Movie> movies) => state.copyWith(
              status: MovieStatus.success,
              movies: movies,
              pageNumber: state.pageNumber + 1),
          onError: (ob, st) => state.copyWith(status: MovieStatus.failure));
    }
  }
}
