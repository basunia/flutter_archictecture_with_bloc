import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:movie_buzz/service_locator.dart';
import 'package:movie_buzz/utils/localization.dart';
import 'package:movie_repository/movie_repository.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final storage = await HydratedStorage.build(
      storageDirectory: await getTemporaryDirectory());
  final services = ServiceLocator();

  /// Used hydrated bloc to persist data
  HydratedBlocOverrides.runZoned(() async {
    runApp(EasyLocalization(
      path: 'assets/locales',
      supportedLocales: Localization.locales,
      saveLocale: true,
      fallbackLocale: Localization.locales.localeUK,
      child: MovieApp(
        movieRepository: MovieRepository(
            movieApiClent: services.movieApiClient,
            localStorageMovieClient: await services.localStorageClient),
      ),
    ));
  }, storage: storage);
}
