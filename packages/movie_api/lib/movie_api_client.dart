import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_api/base_clent.dart';
import 'package:movie_api/model/movie.dart';
import 'package:movie_api/model/movie_detail.dart';

/// Exception thrown when movie search fails.
class MovieListRequestFailure implements Exception {}

/// Exception thrown when the provided movie list is not found.
class MovieListNotFoundFailure implements Exception {}

/// Exception thrown when movie detail search fails by imdbId.
class MovieDetailRequestFailure implements Exception {}

/// Exception thrown when the provided movie detail is not found.
class MovieDetailNotFoundFailure implements Exception {}

/// we'll search movie list which contain the word 'man' in there titles
// const String searchTitle = 'man';
const String apiKey = '150aa116';

class MovieApiClent {
  MovieApiClent({Dio? apiClient}) : _apiClient = apiClient ?? dio;

  final Dio _apiClient;

  Future<List<Movie>> getMovies(
      {int page = 1, String searchTitle = 'man'}) async {
    try {
      final response = await _apiClient.get('',
          queryParameters: {'apikey': apiKey, 's': searchTitle, 'page': page});

      if (response.statusCode != 200) {
        throw MovieListRequestFailure();
      }
      if (response.data['Search'] == null) {
        return <Movie>[];
      }
      List<Movie> movies =
          response.data['Search'].map<Movie>((e) => Movie.fromJson(e)).toList();
      return movies;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      throw MovieListRequestFailure();
    }
  }

  Future<MovieDetail> getMovieDetail(String imdbId) async {
    try {
      final response = await _apiClient.get('',
          queryParameters: {'apikey': apiKey, 'i': imdbId, 'plot': 'full'});

      if (response.statusCode != 200) {
        throw MovieDetailRequestFailure();
      }
      return MovieDetail.fromJson(response.data);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      throw MovieDetailRequestFailure();
    }
  }
}
