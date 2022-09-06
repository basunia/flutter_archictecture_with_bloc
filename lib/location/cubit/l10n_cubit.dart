import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'l10n_state.dart';

// part 'l10n_state.dart';

class L10nCubit extends HydratedCubit<L10nState> {
  L10nCubit() : super(const L10nState());

  void setLocale(int localeId) {
    emit(state.copyWith(localeId: localeId));
  }

  @override
  L10nState? fromJson(Map<String, dynamic> json) => L10nState.fromJsom(json);

  @override
  Map<String, dynamic>? toJson(L10nState state) => state.toJson();
}
