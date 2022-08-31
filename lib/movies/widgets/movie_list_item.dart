import 'package:flutter/material.dart';
import 'package:movie_api/model/movie.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({Key? key, required this.movie, required this.index})
      : super(key: key);
  final Movie movie;
  final int index;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
        child: ListTile(
      leading: Text(
        '$index',
        // style: textTheme.caption,
      ),
      title: Text(
        movie.title,
        // style: textTheme.bodyMedium,
      ),
      trailing: Text(movie.imdbId),
      dense: true,
    ));
  }
}
