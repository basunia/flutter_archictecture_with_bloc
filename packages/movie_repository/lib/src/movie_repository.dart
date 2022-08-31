import 'dart:ffi';

import 'package:movie_api/data/movie_dao.dart';
import 'package:movie_api/model/movie.dart';
import 'package:movie_api/model/movie_detail.dart';
import 'package:movie_api/movie_api_client.dart';

class MovieRepository {
  MovieRepository(
      {required MovieApiClent movieApiClent,
      required MovieDao localStorageMovieClient})
      : _movieApiClent = movieApiClent,
        _localStorageMovieClient = localStorageMovieClient;

  final MovieApiClent _movieApiClent;
  final MovieDao _localStorageMovieClient;

  Future<void> clearAllData() async =>
      await _localStorageMovieClient.clearAllData();

  Future<void> fetchMovieFromApi({int page = 1}) async {
    final movies = await _movieApiClent.getMovies(page: page);
    await _localStorageMovieClient.insertMovies(movies);
  }

  Future<void> fetchMovieDetailFromApi(String movieId) async {
    final movie = await _movieApiClent.getMovieDetail(movieId);
    await _localStorageMovieClient.insertMovieDetail(movie);
  }

  Stream<List<Movie>> loadMovieFromDbAsStream() =>
      _localStorageMovieClient.findAllMoviesAsStream();

  Future<int?> countMovieList() =>
      _localStorageMovieClient.countMovieListItem();

  Stream<MovieDetail?> loadMovieDetailFromDbAsStream(String movieId) =>
      _localStorageMovieClient.findMovieDetailByIdAsStream(movieId);

  Future<MovieDetail?> loadMovieDetailFromDb(String movieId) =>
      _localStorageMovieClient.findMovieDetailById(movieId);
}
