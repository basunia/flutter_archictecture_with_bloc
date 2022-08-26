import 'package:movie_api/data/movie_dao.dart';
import 'package:movie_api/data/movie_database.dart';
import 'package:movie_api/movie_api_client.dart';

class ServiceLocator {
  Future<MovieDao> get localStorageClient async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    return database.movieDao;
  }

  MovieApiClent get movieApiClient {
    return MovieApiClent();
  }
}
