import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:movie_api/model/movie.dart';
import 'package:movie_buzz/service_locator.dart';
import 'package:movie_repository/movie_repository.dart';
import 'package:stream_transform/stream_transform.dart';

import 'movies_bloc_state.dart';

part 'movies_bloc_event.dart';
// part 'movies_bloc_state.dart';

const movieLimit = 10;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class MoviesBloc extends HydratedBloc<MoviesEvent, MoviesBlocState> {
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
      if (event.movieFetchType == MovieFetchType.refresh) {
        await _movieRepository.clearAllData();
        await clear();
      }

      /// Check whether data availables on db
      /// if not, then fetch from server on startup
      if (event.movieFetchType == MovieFetchType.startup) {
        final appDatabase = await ServiceLocator.appDatabase;
        final result = await appDatabase.movieCount;
        print('Movie count $result');
        if (result != 0) return;
      }

      emit(state.copyWith(
          status: state.movies.isEmpty ||
                  event.movieFetchType == MovieFetchType.refresh
              ? MovieStatus.initial
              : MovieStatus.loading,
          pageNumber:
              event.movieFetchType == MovieFetchType.refresh ? 1 : null));
      final page = state.pageNumber;
      debugPrint('Page:=======> $page');
      await _movieRepository.fetchMovieFromApi(page: page);
    } catch (e) {
      emit(state.copyWith(status: MovieStatus.failure));
    }
  }

  _onSubscriptionRequested(MovieListSubscriptionRequested event,
      Emitter<MoviesBlocState> emit) async {
    if (state.status == MovieStatus.initial) {
      await emit.forEach(_movieRepository.loadMovieFromDbAsStream(),
          onData: (List<Movie> movies) => state.copyWith(
              status: MovieStatus.success,
              movies: movies,
              pageNumber: state.pageNumber + 1),
          onError: (ob, st) => state.copyWith(status: MovieStatus.failure));
    }
  }

  @override
  MoviesBlocState? fromJson(Map<String, dynamic> json) =>
      MoviesBlocState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(MoviesBlocState state) => state.toJson();
}
