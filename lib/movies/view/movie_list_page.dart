import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_buzz/movie_details/view/movie_detail_page.dart';
import 'package:movie_buzz/movies/bloc/movies_bloc.dart';
import 'package:movie_buzz/movies/widgets/home_nav_drawer.dart';
import 'package:movie_buzz/utils/toast.dart';
import 'package:movie_buzz/movies/widgets/bottom_loader.dart';
import 'package:movie_buzz/movies/widgets/movie_list_empty.dart';
import 'package:movie_buzz/movies/widgets/movie_list_error.dart';
import 'package:movie_buzz/movies/widgets/movie_list_item.dart';
import 'package:movie_buzz/movies/widgets/movie_list_loading.dart';
import 'package:movie_buzz/utils/internet_checker.dart';
import 'package:movie_repository/movie_repository.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../bloc/movies_bloc_state.dart';
import '../widgets/custom_list_loader_view.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MoviesBloc(movieRepository: context.read<MovieRepository>())
            ..add(MovieListSubscriptionRequested()),
      child: const MovieListView(),
    );
  }
}

class MovieListView extends StatefulWidget {
  const MovieListView({Key? key}) : super(key: key);

  @override
  State<MovieListView> createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _fetchMovieList(movieFetchType: MovieFetchType.startup);
    _scrollController.addListener(_onScroll);
  }

  _fetchMovieList({required MovieFetchType movieFetchType}) async {
    // if (await isInternetAvailable) {
    context
        .read<MoviesBloc>()
        .add(MovieListFetched(movieFetchType: movieFetchType));
    // } else {
    //   showNoInternerMessage(context, 'no_internet_msg');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('title').tr()),
      drawer: const NavigationDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: RefreshIndicator(
          onRefresh: () async {
            _fetchMovieList(movieFetchType: MovieFetchType.refresh);
          },
          child: BlocConsumer<MoviesBloc, MoviesBlocState>(
            listenWhen: (previous, current) {
              return current.status.isNoConnection ||
                  current.status.isFailureOnPagination;
            },
            listener: (context, state) {
              showMessage(
                  context,
                  state.status.isNoConnection
                      ? 'no_internet_msg'
                      : 'erorr_message');
            },
            buildWhen: (previous, current) {
              return !current.status.isFailureOnPagination;
            },
            builder: (context, state) {
              switch (state.status) {
                case MovieStatus.failure:
                case MovieStatus.noConnection:
                  return MovieListError(
                    onRefresh: () {
                      _fetchMovieList(movieFetchType: MovieFetchType.refresh);
                    },
                  );
                case MovieStatus.initial:
                  return const CutomListLoaderView();
                case MovieStatus.success:
                default:
                  if (state.movies.isEmpty) {
                    return Center(
                      child: MovieListEmpty(refresh: () {
                        _fetchMovieList(movieFetchType: MovieFetchType.refresh);
                      }),
                    );
                  }
                  return ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: state.hasReachedMax
                          ? state.movies.length
                          : state.movies.length + 1,
                      controller: _scrollController,
                      itemBuilder: (context, i) {
                        return i >= state.movies.length
                            ? const BottomLoader()
                            // ? ButtonLoadMore(loadMore: () {
                            //     context.read<MoviesBloc>().add(MovieListFetched());
                            //   })
                            : InkWell(
                                onTap: () => Navigator.push(
                                    context,
                                    MovieDetailPage.route(
                                        movie: state.movies[i])),
                                child: MovieListItem(
                                    movie: state.movies[i], index: i),
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
              }
            },
          ),
          // },
          // builder: (context, state) {
          //   return BlocBuilder<MoviesBloc, MoviesBlocState>(
          //       buildWhen: (previous, current) {
          //     return !current.status.isFailureOnPagination;
          //   },
        ),
      ),
    );
    // );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.atEdge) {
      bool isTop = _scrollController.position.pixels == 0;
      if (!isTop) {
        _fetchMovieList(movieFetchType: MovieFetchType.pagination);
      }
    }

    // if (_isBottom) {
    //   context.read<MoviesBloc>().add(MovieListFetched());
    // }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
