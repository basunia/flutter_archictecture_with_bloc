import 'package:flutter/material.dart';
import 'package:movie_api/model/movie.dart';
import 'package:movie_api/movie_api_client.dart';

void main() {
  runApp(const MovieApplication());
}

class MovieApplication extends StatefulWidget {
  const MovieApplication({Key? key}) : super(key: key);

  @override
  State<MovieApplication> createState() => _MovieApplicationState();
}

class _MovieApplicationState extends State<MovieApplication> {
  List<Movie> movieList = [];
  @override
  void initState() {
    prepareMovie();
    super.initState();
  }

  final client = MovieApiClent();

  void prepareMovie() async {
    movieList = await client.getMovies(1);
    print('movieList: $movieList');
    final firstMovie = await client.getMovieDetail(movieList.first.imdbId);
    print('Detail ===> ${firstMovie.plot}');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Movie List'),
            ),
            body: const Text('Movie Buzz Starting..')));
  }
}
