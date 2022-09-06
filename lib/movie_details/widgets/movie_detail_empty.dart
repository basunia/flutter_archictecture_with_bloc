import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MovieDetailEmpty extends StatelessWidget {
  const MovieDetailEmpty({Key? key, required this.refresh}) : super(key: key);
  final void Function() refresh;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'empty_data_single',
            style: textTheme.caption,
          ).tr(),
          const SizedBox(
            height: 4.0,
          ),
          ElevatedButton(
              onPressed: refresh,
              child: const Text(
                'back_to_home',
              ).tr()),
        ],
      ),
    );
  }
}
