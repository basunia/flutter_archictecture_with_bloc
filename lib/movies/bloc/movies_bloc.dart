import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:movie_api/model/movie.dart';
import 'package:movie_buzz/movie_details/bloc/movie_detail_bloc.dart';
import 'package:movie_buzz/movies/view/movie_list_page.dart';
import 'package:movie_buzz/service_locator.dart';
import 'package:movie_repository/movie_repository.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../utils/internet_checker.dart';
import '../../utils/random_search_keywoed.dart';
import 'movies_bloc_state.dart';

part 'movies_bloc_event.dart';

const movieLimit = 10;
const throttleDuration = Duration(milliseconds: 200);

/// Used for `debounce` the api request that might causes high traffic issue.
EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

/// Communicates with [MovieListPage] to exchange data
/// It uses [HydratedBloc] to save `pageNumber` and `searchKeyword` for next search after app restart.
class MoviesBloc extends HydratedBloc<MoviesEvent, MoviesBlocState> {
  MoviesBloc({required MovieRepository movieRepository})
      : _movieRepository = movieRepository,
        super(const MoviesBlocState()) {
    on<MovieListFetched>(
      _fetchMovies,
      transformer: throttleDroppable(throttleDuration),
    );
    on<MovieListSubscriptionRequested>(_onSubscriptionRequested);
  }
  final MovieRepository _movieRepository;

  String? movieSearchKeyword;

  /// Makes network call, fetch data and insert in db
  _fetchMovies(MovieListFetched event, Emitter<MoviesBlocState> emit) async {
    if (state.hasReachedMax) return;
    try {
      /// Clear all app data on refresh, so tha user gets fresh data from server
      if (event.movieFetchType.isRefresh) {
        await _movieRepository.clearAllData();
        await clear();
      }

      /// Check whether data availables on db
      /// if not, then fetch from server on startup
      if (event.movieFetchType.isStartup) {
        final appDatabase = await ServiceLocator.appDatabase;
        final result = await appDatabase.movieCount;
        print('Movie count $result');
        if (result != 0) return;
      }
      emit(state.copyWith(
          status: state.movies.isEmpty && !event.movieFetchType.isPagination ||
                  event.movieFetchType.isRefresh
              ? MovieStatus.initial
              : MovieStatus.loading,
          pageNumber: event.movieFetchType.isRefresh ? 1 : null));
      final page = state.pageNumber;
      debugPrint('Page:=======> $page');

      //TODO: need to remove [its for testing purpose]
      // await Future<void>.delayed(const Duration(milliseconds: 1000));

      List<Movie> movies = await _movieRepository.fetchMovieFromApi(
          page: page,
          searchTitle: event.movieFetchType.isPagination
              ? state.searchKeyword
              : movieSearchKeyword = getRandomString(3));

      /// If movie list is not empty, then it'will insert into database, and [emit] is controlled by
      /// [_onSubscriptionRequested] functions
      if (movies.isEmpty) {
        emit(state.copyWith(
            movies: !event.movieFetchType.isPagination ? movies : null,
            status: event.movieFetchType.isPagination
                ? MovieStatus.failureOnPagination
                : MovieStatus.success,
            searchKeyword: movieSearchKeyword));
      }
    } catch (e) {
      emit(state.copyWith(
          searchKeyword: movieSearchKeyword,
          status: event.movieFetchType.isPagination
              ? MovieStatus.failureOnPagination
              : !(await isInternetAvailable)
                  ? MovieStatus.noConnection
                  : MovieStatus.failure));
    }
  }

  /// When data is inserted into database, that data also available to user by subscribing
  /// into databse
  _onSubscriptionRequested(MovieListSubscriptionRequested event,
      Emitter<MoviesBlocState> emit) async {
    if (state.status.isInitial) {
      await emit.forEach(_movieRepository.loadMovieFromDbAsStream(),
          onData: (List<Movie> movies) => state.copyWith(
                status: MovieStatus.success,
                movies: movies,
                pageNumber: state.pageNumber + 1,
                searchKeyword: movieSearchKeyword,
              ),
          onError: (ob, st) => state.copyWith(status: MovieStatus.failure));
    }
  }

  @override
  MoviesBlocState? fromJson(Map<String, dynamic> json) =>
      MoviesBlocState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(MoviesBlocState state) => state.toJson();
}
