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
}
