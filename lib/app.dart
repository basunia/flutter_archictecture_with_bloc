import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_buzz/movies/bloc/movies_bloc_bloc.dart';
import 'package:movie_buzz/movies/view/movie_list_page.dart';
import 'package:movie_repository/movie_repository.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key, required MovieRepository movieRepository})
      : _movieRepository = movieRepository,
        super(key: key);

  final MovieRepository _movieRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _movieRepository,
      child: const MovieAppView(),
    );
  }
}

class MovieAppView extends StatelessWidget {
  const MovieAppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MovieListPage(),
    );
  }
}
