import 'dart:async';

import 'package:floor/floor.dart';
import 'package:movie_api/data/movie_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../model/movie.dart';
import '../model/movie_detail.dart';
part 'movie_database.g.dart';

@Database(version: 1, entities: [Movie, MovieDetail])
abstract class AppDatabase extends FloorDatabase {
  MovieDao get movieDao;

  // Since count method yet not supported by floor, hence here is a workaround to get this
  // Issue: https://github.com/pinchbv/floor/issues/576#issuecomment-965729681
  Future<int> get movieCount async {
    final result =
        await database.rawQuery("SELECT COUNT(`id`) AS cnt FROM Movie");

    return result.isEmpty ? 0 : result[0]['cnt'] as int? ?? 0;
  }
}
