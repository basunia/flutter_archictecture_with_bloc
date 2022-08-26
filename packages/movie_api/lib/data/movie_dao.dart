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
  Stream<MovieDetail?> findMovieDetailById(String imdbId);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertMovies(List<Movie> movie);

  @Query('SELECT * FROM Movie')
  Stream<List<Movie>> findAllMoviesAsStream();

  // @Query('SELECT * FROM Movie WHERE id = :id')
  // Stream<Movie?> findMovieById(int id);
}
