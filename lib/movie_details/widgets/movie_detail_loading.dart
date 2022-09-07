import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MovieDetailLoading extends StatelessWidget {
  const MovieDetailLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 2,
        ),
        Center(
          child: Text(
            'loading_movie_single',
            style: theme.textTheme.headline5,
          ).tr(),
        ),
        const Padding(
          padding: EdgeInsets.all(16),
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}
