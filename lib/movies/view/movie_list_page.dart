import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_buzz/movies/bloc/movies_bloc.dart';
import 'package:movie_buzz/movies/widgets/movie_list_empty.dart';
import 'package:movie_buzz/movies/widgets/movie_list_error.dart';
import 'package:movie_buzz/movies/widgets/movie_list_item.dart';
import 'package:movie_buzz/movies/widgets/movie_list_loading.dart';
import 'package:movie_repository/movie_repository.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MoviesBloc(movieRepository: context.read<MovieRepository>())
            ..add(MovieListFetched()),
      child: const MovieListView(),
    );
  }
}

class MovieListView extends StatelessWidget {
  const MovieListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie Buzz')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            BlocBuilder<MoviesBloc, MoviesBlocState>(builder: (context, state) {
          switch (state.status) {
            case MovieStatus.failure:
              return const MovieListError();
            case MovieStatus.success:
              if (state.movies.isEmpty) {
                return const MovieListEmpty();
              }
              return ListView.builder(
                  itemCount: state.movies.length,
                  itemBuilder: (context, i) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (i % 10 == 0) const Text('------------------'),
                        MovieListItem(movie: state.movies[i]),
                      ],
                    );
                    // return Padding(
                    //   padding: const EdgeInsets.all(4.0),
                    //   child: Column(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       if (i % 10 == 0) const Text('------------'),
                    //       Text(
                    //         'id  ${state.movies[i].id} title : ${state.movies[i].title}',
                    //         style: const TextStyle(fontSize: 18.0),
                    //       ),
                    //     ],
                    //   ),
                    // );
                  });
            case MovieStatus.loading:
            default:
              return const MovieListLoading();
          }
        }),
      ),
    );
  }
}
