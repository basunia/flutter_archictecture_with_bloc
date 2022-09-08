import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_api/model/movie.dart';
import 'package:movie_buzz/movies/widgets/bottom_loader.dart';
import 'package:movie_buzz/movies/widgets/circular_loader.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({Key? key, required this.movie, required this.index})
      : super(key: key);
  final Movie movie;
  final int index;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.all(4.0),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: FittedBox(
            fit: BoxFit.fill,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
              child: CachedNetworkImage(
                imageUrl: movie.poster,
                placeholder: (context, url) => const CircularLoader(),
                errorWidget: (context, url, error) => const Icon(Icons.movie),
              ),
            ),
          )),
          Padding(
            padding: const EdgeInsets.fromLTRB(4.0, 8, 4, 8),
            child: Text(
              '${index + 1}. ${movie.title}',
              style:
                  textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w400),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
