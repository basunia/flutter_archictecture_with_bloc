import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_api/model/movie_detail.dart';
import 'package:movie_buzz/utils/internet_checker.dart';
import 'package:movie_repository/movie_repository.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc({required MovieRepository movieRepository})
      : _movieRepository = movieRepository,
        super(const MovieDetailState()) {
    on<MovieDetailSubscriptionRequested>(_onMovieDetailSubscriptionRequested);
    on<MovieDetailFetched>(_onMovieDetailFetched);
  }

  final MovieRepository _movieRepository;

  _onMovieDetailFetched(
      MovieDetailFetched event, Emitter<MovieDetailState> emit) async {
    try {
      // Check whether data availables on db
      final result =
          await _movieRepository.loadMovieDetailFromDb(event.movieId);
      if (result != null) return;

      emit(state.copyWith(movieDetailStatus: MovieDetailStatus.initial));
      await _movieRepository.fetchMovieDetailFromApi(event.movieId);
    } catch (_) {
      emit(state.copyWith(
          movieDetailStatus: !(await isInternetAvailable)
              ? MovieDetailStatus.noConnection
              : MovieDetailStatus.failure));
    }
  }

  _onMovieDetailSubscriptionRequested(MovieDetailSubscriptionRequested event,
      Emitter<MovieDetailState> emit) async {
    try {
      await emit.forEach(
          _movieRepository.loadMovieDetailFromDbAsStream(event.movieId),
          onData: (MovieDetail? movieDetail) => state.copyWith(
              movieDetail: movieDetail,
              movieDetailStatus: MovieDetailStatus.success),
          onError: (_, __) =>
              state.copyWith(movieDetailStatus: MovieDetailStatus.failure));
    } catch (_) {
      emit(state.copyWith(movieDetailStatus: MovieDetailStatus.failure));
    }
  }
}
