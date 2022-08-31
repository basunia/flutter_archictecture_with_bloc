import 'package:movie_api/data/movie_dao.dart';
import 'package:movie_api/data/movie_database.dart';
import 'package:movie_api/movie_api_client.dart';

class ServiceLocator {
  static AppDatabase? _appDatabase;

  Future<MovieDao> get localStorageClient async {
    final database = await appDatabase;
    return database.movieDao;
  }

  static Future<AppDatabase> get appDatabase async {
    return _appDatabase ??
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  }

  MovieApiClent get movieApiClient {
    return MovieApiClent();
  }
}
