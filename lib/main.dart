import 'package:flutter/material.dart';
import 'package:movie_buzz/service_locator.dart';
import 'package:movie_repository/movie_repository.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final services = ServiceLocator();
  runApp(MovieApp(
    movieRepository: MovieRepository(
        movieApiClent: services.movieApiClient,
        localStorageMovieClient: await services.localStorageClient),
  ));
}



// class MovieApplication extends StatefulWidget {
//   const MovieApplication({Key? key}) : super(key: key);

//   @override
//   State<MovieApplication> createState() => _MovieApplicationState();
// }

// class _MovieApplicationState extends State<MovieApplication> {
//   List<Movie> movieList = [];
//   @override
//   void initState() {
//     prepareMovie();
//     super.initState();
//   }

//   final client = MovieApiClent();

//   void prepareMovie() async {
//     //initialize db
//     final database =
//         await $FloorAppDatabase.databaseBuilder('app_database.db').build();

//     movieList = await client.getMovies(page: 1);
//     // print('movieList: $movieList');
//     final firstMovie = await client.getMovieDetail(movieList.first.imdbId);
//     print('Detail ===> ${firstMovie.plot}');

//     final movieDao = database.movieDao;

//     // await personDao.insertMovie(movieList.last);
//     // final result = personDao.findMovieById(1).listen((event) {
//     //   print('Movie title from databae ${event?.title}');
//     // });
//     await movieDao.insertMovies(movieList);
//     final result = movieDao.findAllMoviesAsStream().listen((event) {
//       print('Movie list from databae $event');
//     });

//     await movieDao.insertMovieDetail(firstMovie);

//     await movieDao.findMovieDetailById(1).listen((event) {
//       print('MovieDetail first $event');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//             appBar: AppBar(
//               title: const Text('Movie List'),
//             ),
//             body: const Text('Movie Buzz Starting..')));
//   }
// }
