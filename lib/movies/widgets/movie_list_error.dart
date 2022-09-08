import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MovieListError extends StatelessWidget {
  const MovieListError(
      {Key? key, required this.searchedKeyword, required this.onRefresh})
      : super(key: key);

  final void Function() onRefresh;
  final String searchedKeyword;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 100.0,
        ),
        const Text('🙈', style: TextStyle(fontSize: 48)),
        Center(
          child: Text(
            'erorr_message',
            style: theme.textTheme.bodyMedium,
          ).tr(),
        ),
        const SizedBox(
          height: 12.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'searched_keyword',
              style: theme.textTheme.bodyMedium,
            ).tr(),
            Text(
              ' $searchedKeyword',
              style: theme.textTheme.headline3,
            ).tr(),
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
        OutlinedButton(
            onPressed: onRefresh,
            child: Text(
              'refresh',
              style: theme.textTheme.headline3,
            ).tr()),
      ],
    );
  }
}
