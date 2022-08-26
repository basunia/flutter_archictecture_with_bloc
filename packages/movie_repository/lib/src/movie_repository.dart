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

  void fetchMovieFromApi(int page) async {
    final movies = await _movieApiClent.getMovies(page: page);
    await _localStorageMovieClient.insertMovies(movies);
  }

  void fetchMovieDetailFromApi(String movieId) async {
    final movie = await _movieApiClent.getMovieDetail(movieId);
    await _localStorageMovieClient.insertMovieDetail(movie);
  }

  Stream<List<Movie>> loadMovieFromDb() =>
      _localStorageMovieClient.findAllMoviesAsStream();

  Stream<MovieDetail?> loadMovieDetailFromDb(String movieId) =>
      _localStorageMovieClient.findMovieDetailById(movieId);
}
