import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_api/model/movie.dart';
import 'package:movie_buzz/movie_details/bloc/movie_detail_bloc.dart';
import 'package:movie_buzz/movie_details/widgets/movie_detail_empty.dart';
import 'package:movie_buzz/movie_details/widgets/movie_detail_loading.dart';
import 'package:movie_buzz/movies/widgets/movie_list_error.dart';
import 'package:movie_buzz/movies/widgets/movie_list_loading.dart';
import 'package:movie_buzz/utils/internet_checker.dart';
import 'package:movie_buzz/utils/toast.dart';
import 'package:movie_repository/movie_repository.dart';

import '../widgets/movie_detail_error.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({Key? key, required this.movie}) : super(key: key);

  static Route<void> route({required Movie movie}) {
    return MaterialPageRoute(
      fullscreenDialog: false,
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
    // if (await isInternetAvailable) {
    context
        .read<MovieDetailBloc>()
        .add(MovieDetailFetched(movieId: widget.movie.imdbId));
    // } else {
    //   showNoInternerMessage(context, 'no_internet_msg');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('movie_detail').tr()),
      body: Center(
        child: BlocConsumer<MovieDetailBloc, MovieDetailState>(
          listenWhen: ((previous, current) =>
              current.movieDetailStatus.isNoConnection),
          listener: (context, state) {
            showMessage(context, 'no_internet_msg');
          },
          // builder: (context, state) {
          //   return BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            switch (state.movieDetailStatus) {
              case MovieDetailStatus.initial:
                return const MovieDetailLoading();
              case MovieDetailStatus.failure:
              case MovieDetailStatus.noConnection:
                {
                  return MovieDetailError(onRefresh: () {
                    // Navigator.pop(context);
                    _fetchMovieDetail();
                  });
                }
              case MovieDetailStatus.success:
              default:
                if (state.movieDetail == null) {
                  return MovieDetailEmpty(refresh: () {
                    Navigator.pop(context);
                  });
                }
                return SingleChildScrollView(
                  child: Card(
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
                  ),
                );
            }
          },
          //   );
          // },
        ),
      ),
    );
  }
}
