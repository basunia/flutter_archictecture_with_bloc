// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MovieDao? _movieDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Movie` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `title` TEXT NOT NULL, `year` TEXT NOT NULL, `imdbId` TEXT NOT NULL, `poster` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `MovieDetail` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `imdbId` TEXT NOT NULL, `poster` TEXT NOT NULL, `title` TEXT NOT NULL, `year` TEXT NOT NULL, `released` TEXT NOT NULL, `genre` TEXT NOT NULL, `plot` TEXT NOT NULL, `director` TEXT NOT NULL, `imdbRating` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MovieDao get movieDao {
    return _movieDaoInstance ??= _$MovieDao(database, changeListener);
  }
}

class _$MovieDao extends MovieDao {
  _$MovieDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _movieDetailInsertionAdapter = InsertionAdapter(
            database,
            'MovieDetail',
            (MovieDetail item) => <String, Object?>{
                  'id': item.id,
                  'imdbId': item.imdbId,
                  'poster': item.poster,
                  'title': item.title,
                  'year': item.year,
                  'released': item.released,
                  'genre': item.genre,
                  'plot': item.plot,
                  'director': item.director,
                  'imdbRating': item.imdbRating
                },
            changeListener),
        _movieInsertionAdapter = InsertionAdapter(
            database,
            'Movie',
            (Movie item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'year': item.year,
                  'imdbId': item.imdbId,
                  'poster': item.poster
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MovieDetail> _movieDetailInsertionAdapter;

  final InsertionAdapter<Movie> _movieInsertionAdapter;

  @override
  Stream<MovieDetail?> findMovieDetailByIdAsStream(String imdbId) {
    return _queryAdapter.queryStream(
        'SELECT * FROM MovieDetail WHERE imdbId = ?1',
        mapper: (Map<String, Object?> row) => MovieDetail(
            id: row['id'] as int?,
            imdbId: row['imdbId'] as String,
            poster: row['poster'] as String,
            title: row['title'] as String,
            year: row['year'] as String,
            released: row['released'] as String,
            genre: row['genre'] as String,
            plot: row['plot'] as String,
            director: row['director'] as String,
            imdbRating: row['imdbRating'] as String),
        arguments: [imdbId],
        queryableName: 'MovieDetail',
        isView: false);
  }

  @override
  Future<MovieDetail?> findMovieDetailById(String imdbId) async {
    return _queryAdapter.query('SELECT * FROM MovieDetail WHERE imdbId = ?1',
        mapper: (Map<String, Object?> row) => MovieDetail(
            id: row['id'] as int?,
            imdbId: row['imdbId'] as String,
            poster: row['poster'] as String,
            title: row['title'] as String,
            year: row['year'] as String,
            released: row['released'] as String,
            genre: row['genre'] as String,
            plot: row['plot'] as String,
            director: row['director'] as String,
            imdbRating: row['imdbRating'] as String),
        arguments: [imdbId]);
  }

  @override
  Stream<List<Movie>> findAllMoviesAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM Movie',
        mapper: (Map<String, Object?> row) => Movie(
            id: row['id'] as int?,
            title: row['title'] as String,
            year: row['year'] as String,
            imdbId: row['imdbId'] as String,
            poster: row['poster'] as String),
        queryableName: 'Movie',
        isView: false);
  }

  @override
  Future<void> insertMovieDetail(MovieDetail movieDetail) async {
    await _movieDetailInsertionAdapter.insert(
        movieDetail, OnConflictStrategy.replace);
  }

  @override
  Future<void> insertMovies(List<Movie> movie) async {
    await _movieInsertionAdapter.insertList(movie, OnConflictStrategy.replace);
  }
}
