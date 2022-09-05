import 'package:flutter/material.dart';

class MovieListError extends StatelessWidget {
  const MovieListError({Key? key, required this.onRefresh}) : super(key: key);

  final void Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('🙈', style: TextStyle(fontSize: 48)),
        Center(
          child: Text(
            'Something went wrong!',
            style: theme.textTheme.bodyMedium,
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        ElevatedButton(onPressed: onRefresh, child: const Text('Refresh')),
      ],
    );
  }
}
