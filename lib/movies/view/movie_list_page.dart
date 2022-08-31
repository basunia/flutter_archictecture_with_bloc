import 'package:cached_network_image/cached_network_image.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movie_buzz/movie_details/view/movie_detail_page.dart';
import 'package:movie_buzz/movies/bloc/movies_bloc.dart';
import 'package:movie_buzz/movies/widgets/bottom_loader.dart';
import 'package:movie_buzz/movies/widgets/button_load_more.dart';
import 'package:movie_buzz/movies/widgets/movie_list_empty.dart';
import 'package:movie_buzz/movies/widgets/movie_list_error.dart';
import 'package:movie_buzz/movies/widgets/movie_list_item.dart';
import 'package:movie_buzz/movies/widgets/movie_list_loading.dart';
import 'package:movie_buzz/utils/internet_checker.dart';
import 'package:movie_repository/movie_repository.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

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
    _fetchMovieList(isOnStartUp: true);
    _scrollController.addListener(_onScroll);
  }

  _fetchMovieList({bool isOnStartUp = false}) async {
    if (await isInternetAvailable) {
      context
          .read<MoviesBloc>()
          .add(MovieListFetched(isOnStartUp: isOnStartUp));
    } else {
      showTopSnackBar(
        context,
        const CustomSnackBar.error(
          textStyle: TextStyle(fontSize: 20.0),
          message: 'Sorry no Internet!. Please check your connnection',
        ),
      );
    }
  }

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
            case MovieStatus.initial:
              return const MovieListLoading();
            case MovieStatus.success:
            default:
              if (state.movies.isEmpty) {
                return const MovieListEmpty();
              }
              return ListView.builder(
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
                        : GestureDetector(
                            onTap: () => Navigator.push(context,
                                MovieDetailPage.route(movie: state.movies[i])),
                            child: Card(
                              elevation: 2.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Center(
                                        child: Container(
                                      // decoration: BoxDecoration(
                                      //   borderRadius: BorderRadius.all(2)
                                      // ),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: CachedNetworkImage(
                                          imageUrl: state.movies[i].poster,
                                          placeholder: (context, url) =>
                                              const CircularProgressIndicator(),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      ),
                                    )),
                                  ),
                                  if (i % 10 == 0)
                                    const Text('------------------'),
                                  MovieListItem(movie: state.movies[i]),
                                ],
                              ),
                            ),
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
        }),
      ),
    );
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
      if (isTop) {
        print('At the top');
      } else {
        print('At the bottom');
        _fetchMovieList();
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
