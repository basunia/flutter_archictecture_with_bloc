import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MovieListEmpty extends StatelessWidget {
  const MovieListEmpty(
      {Key? key, required this.searchedKeyword, required this.refresh})
      : super(key: key);
  final void Function() refresh;
  final String searchedKeyword;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 48.0,
          ),
          Text(
            'empty_data',
            style: textTheme.bodyMedium,
          ).tr(),
          const SizedBox(
            height: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'searched_keyword',
                style: textTheme.bodyMedium,
              ).tr(),
              Text(
                ' $searchedKeyword',
                style: textTheme.headline3,
              ).tr(),
            ],
          ),
          const SizedBox(
            height: 12.0,
          ),
          OutlinedButton(
              onPressed: refresh,
              child: Text(
                'refresh',
                style: textTheme.headline3,
              ).tr()),
        ],
      ),
    );
  }
}
