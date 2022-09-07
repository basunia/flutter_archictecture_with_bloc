import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'settings_state.dart';

// part 'l10n_state.dart';

class SettingsCubit extends HydratedCubit<SettingsState> {
  SettingsCubit() : super(const SettingsState());

  void setLocale(int localeId) {
    emit(state.copyWith(localeId: localeId));
  }

  @override
  SettingsState? fromJson(Map<String, dynamic> json) =>
      SettingsState.fromJsom(json);

  @override
  Map<String, dynamic>? toJson(SettingsState state) => state.toJson();
}
