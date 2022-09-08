import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_buzz/movie_details/view/movie_detail_page.dart';
import 'package:movie_buzz/movies/bloc/movies_bloc.dart';
import 'package:movie_buzz/movies/widgets/home_nav_drawer.dart';
import 'package:movie_buzz/utils/responsive_util.dart';
import 'package:movie_buzz/utils/toast.dart';
import 'package:movie_buzz/movies/widgets/bottom_loader.dart';
import 'package:movie_buzz/movies/widgets/movie_list_empty.dart';
import 'package:movie_buzz/movies/widgets/movie_list_error.dart';
import 'package:movie_buzz/movies/view/movie_list_item.dart';
import 'package:movie_repository/movie_repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../bloc/movies_bloc_state.dart';
import '../widgets/custom_list_loader_view.dart';

/// Landing page where all movies are listed in grid view
/// It communicate with [MoviesBloc] for exchanging `even` and `state`
/// Based on different states from [MoviesBlocState], screen gets updated.
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
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    _fetchMovieList(movieFetchType: MovieFetchType.startup);
    _scrollController.addListener(_onScroll);
  }

  _fetchMovieList({required MovieFetchType movieFetchType}) async {
    context
        .read<MoviesBloc>()
        .add(MovieListFetched(movieFetchType: movieFetchType));
  }

  void _onRefresh() async {
    // monitor network fetch
    _fetchMovieList(movieFetchType: MovieFetchType.refresh);
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      body: SmartRefresher(
        onRefresh: _onRefresh,
        enablePullUp: false,
        enablePullDown: true,
        controller: _refreshController,
        child: CustomScrollView(controller: _scrollController, slivers: [
          SliverAppBar(
            pinned: false,
            title: const Text('title').tr(),
            snap: true,
            floating: true,
          ),
          SliverToBoxAdapter(
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
                      searchedKeyword: state.searchKeyword,
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
                        child: MovieListEmpty(
                            searchedKeyword: state.searchKeyword,
                            refresh: () {
                              _fetchMovieList(
                                  movieFetchType: MovieFetchType.refresh);
                            }),
                      );
                    }
                    final orientation = MediaQuery.of(context).orientation;
                    return GridView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: orientation.isLandScape ? 4 : 2),
                        physics: const ScrollPhysics(),
                        itemCount: state.hasReachedMax
                            ? state.movies.length
                            : state.movies.length + 1,
                        // controller: _scrollController,
                        itemBuilder: (context, i) {
                          return i >= state.movies.length
                              ? const BottomLoader()
                              : InkWell(
                                  onTap: () => Navigator.push(
                                      context,
                                      MovieDetailPage.route(
                                          movie: state.movies[i])),
                                  child: MovieListItem(
                                      movie: state.movies[i], index: i),
                                );
                        });
                }
              },
            ),
          ),
        ]),
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

  /// When user scrolls down to bottom of the page the [_fetchMovieList] function triggers,
  /// Needed for pagination
  void _onScroll() {
    if (_scrollController.position.atEdge) {
      bool isTop = _scrollController.position.pixels == 0;
      if (!isTop) {
        _fetchMovieList(movieFetchType: MovieFetchType.pagination);
      }
    }
  }
}
