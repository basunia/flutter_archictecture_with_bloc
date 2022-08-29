import 'package:flutter/material.dart';
import 'package:movie_api/model/movie.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({Key? key, required this.movie}) : super(key: key);
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
        child: ListTile(
      leading: Text(
        '${movie.id}',
        // style: textTheme.caption,
      ),
      title: Text(
        movie.title,
        // style: textTheme.bodyMedium,
      ),
      trailing: Text(movie.imdbId),
    ));
  }
}
