import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_api/model/movie.dart';
import 'package:movie_buzz/movie_details/bloc/movie_detail_bloc.dart';
import 'package:movie_buzz/movie_details/widgets/movie_detail_empty.dart';
import 'package:movie_buzz/movies/widgets/movie_list_empty.dart';
import 'package:movie_buzz/movies/widgets/movie_list_error.dart';
import 'package:movie_buzz/movies/widgets/movie_list_loading.dart';
import 'package:movie_buzz/utils/internet_checker.dart';
import 'package:movie_buzz/utils/toast.dart';
import 'package:movie_repository/movie_repository.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({Key? key, required this.movie}) : super(key: key);

  static Route<void> route({required Movie movie}) {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => MovieDetailPage(
        movie: movie,
      ),
    );
  }

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieDetailBloc>(
      create: (context) =>
          MovieDetailBloc(movieRepository: context.read<MovieRepository>())
            ..add(MovieDetailSubscriptionRequested(movieId: movie.imdbId)),
      child: MovieDetailView(movie: movie),
    );
  }
}

class MovieDetailView extends StatefulWidget {
  const MovieDetailView({Key? key, required this.movie}) : super(key: key);
  final Movie movie;
  @override
  State<MovieDetailView> createState() => _MovieDetailViewState();
}

class _MovieDetailViewState extends State<MovieDetailView> {
  @override
  void initState() {
    _fetchMovieDetail();
    super.initState();
  }

  _fetchMovieDetail() async {
    if (await isInternetAvailable) {
      context
          .read<MovieDetailBloc>()
          .add(MovieDetailFetched(movieId: widget.movie.imdbId));
    } else {
      showNoInternerMessage(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie Detail')),
      body: Center(
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            switch (state.movieDetailStatus) {
              case MovieDetailStatus.initial:
                return const MovieListLoading();
              case MovieDetailStatus.failure:
                {
                  return const MovieListError();
                }
              case MovieDetailStatus.success:
              default:
                if (state.movieDetail == null) {
                  return MovieDetailEmpty(refresh: () {
                    Navigator.pop(context);
                  });
                }
                return Card(
                  elevation: 4.0,
                  child: Column(
                    children: [
                      state.movieDetail?.poster != null
                          ? CachedNetworkImage(
                              imageUrl: state.movieDetail!.poster)
                          : Container(),
                      Text('Movie title, ${state.movieDetail?.title}'),
                      Text('Movie plot, ${state.movieDetail?.plot}'),
                    ],
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
