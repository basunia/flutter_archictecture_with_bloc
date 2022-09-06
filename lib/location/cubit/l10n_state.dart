// part of 'l10n_cubit.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'l10n_state.g.dart';

@JsonSerializable()
class L10nState extends Equatable {
  const L10nState({this.localeId = 0});
  final int localeId;

  L10nState copyWith({int? localeId}) {
    return L10nState(localeId: localeId ?? this.localeId);
  }

  factory L10nState.fromJsom(json) => _$L10nStateFromJson(json);

  Map<String, dynamic> toJson() => _$L10nStateToJson(this);

  @override
  List<Object> get props => [localeId];
}
