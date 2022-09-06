import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MovieListLoading extends StatelessWidget {
  const MovieListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('⛅', style: TextStyle(fontSize: 54)),
          Text(
            'loading_movies',
            style: theme.textTheme.headline5,
          ).tr(),
          const Padding(
            padding: EdgeInsets.all(16),
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
