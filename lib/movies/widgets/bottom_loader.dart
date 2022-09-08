import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_buzz/movies/bloc/movies_bloc.dart';

import '../bloc/movies_bloc_state.dart';

class BottomLoader extends StatelessWidget {
  const BottomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return BlocSelector<MoviesBloc, MoviesBlocState, MovieStatus>(
      selector: (state) {
        return state.status;
      },
      builder: (context, state) {
        return state.isLoading
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                        color: themeData.primaryColor, strokeWidth: 2.0),
                  ),
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
