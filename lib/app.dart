import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_buzz/movies/view/movie_list_page.dart';
import 'package:movie_buzz/settings/cubit/settings_cubit.dart';
import 'package:movie_buzz/utils/theme_util.dart';
import 'package:movie_repository/movie_repository.dart';
import 'package:easy_localization/easy_localization.dart';

import 'settings/cubit/settings_state.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key, required MovieRepository movieRepository})
      : _movieRepository = movieRepository,
        super(key: key);

  final MovieRepository _movieRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _movieRepository,
      child: BlocProvider(
        create: (context) => SettingsCubit(),
        child: MovieAppView(),
      ),
    );
  }
}

class MovieAppView extends StatelessWidget {
  MovieAppView({Key? key}) : super(key: key);
  bool needRebuild = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      buildWhen: ((previous, current) {
        if (previous != current) {
          needRebuild = true;
        }
        return needRebuild;
      }),
      builder: (context, state) {
        debugPrint(
            'Locale id ${state.localeId}, ${context.locale.toStringWithSeparator()}');
        debugPrint('Theme id ${state.themeId},');
        if (needRebuild) {
          _rebuildAllChildren(context);
        }
        return MaterialApp(
          title: 'Movie Library',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme:
              state.themeId == 0 ? ColorsLight.themeData : ColorsDark.themeData,
          home: Builder(builder: (context) {
            debugPrint(
                'Locale id ${state.localeId}, ${context.locale.toStringWithSeparator()}');

            return const MovieListPage();
          }),
        );
      },
    );
  }

  /// https://stackoverflow.com/a/58513635/8198725
  /// TODO: we can overcome the issue by using [getx]
  void _rebuildAllChildren(BuildContext context) {
    debugPrint('Rebuilding children..');
    void rebuild(Element el) {
      el.markNeedsBuild();
      el.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }
}
