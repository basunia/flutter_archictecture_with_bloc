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
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
          ),
          Text(
            'empty_data_single',
            style: textTheme.bodyMedium,
          ).tr(),
          const SizedBox(
            height: 12.0,
          ),
          OutlinedButton(
              onPressed: refresh,
              child: const Text(
                'back_to_home',
              ).tr()),
        ],
      ),
    );
  }
}
