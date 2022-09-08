import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MovieListEmpty extends StatelessWidget {
  const MovieListEmpty({Key? key, required this.refresh}) : super(key: key);
  final void Function() refresh;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 12.0,
          ),
          Text(
            'empty_data',
            style: textTheme.bodyMedium,
          ).tr(),
          const SizedBox(
            height: 12.0,
          ),
          OutlinedButton(
              onPressed: refresh,
              child: const Text(
                'refresh',
              ).tr()),
        ],
      ),
    );
  }
}
