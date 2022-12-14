import 'package:floor/floor.dart';
import 'package:movie_api/model/movie_detail.dart';

import '../model/movie.dart';

@dao
abstract class MovieDao {
  // @insert
  // Future<void> insertMovie(Movie movie);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertMovieDetail(MovieDetail movieDetail);

  @Query('SELECT * FROM MovieDetail WHERE imdbId = :imdbId')
  Stream<MovieDetail?> findMovieDetailByIdAsStream(String imdbId);

  @Query('SELECT * FROM MovieDetail WHERE imdbId = :imdbId')
  Future<MovieDetail?> findMovieDetailById(String imdbId);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertMovies(List<Movie> movie);

  @Query('SELECT * FROM Movie')
  Stream<List<Movie>> findAllMoviesAsStream();

  // yet not supported by floor, issue: https://github.com/pinchbv/floor/issues/576
  @Query('SELECT COUNT(*) FROM Movie')
  Future<int?> countMovieListItem();

  // @Query('SELECT * FROM Movie WHERE id = :id')
  // Stream<Movie?> findMovieById(int id);

  @transaction
  Future<void> clearAllData() async {
    await clearMovies();
    await clearMovieDetails();
  }

  @Query('DELETE from Movie')
  Future<void> clearMovies();

  @Query('DELETE from MovieDetail')
  Future<void> clearMovieDetails();
}
