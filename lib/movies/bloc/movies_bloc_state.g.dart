// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_bloc_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesBlocState _$MoviesBlocStateFromJson(Map<String, dynamic> json) =>
    MoviesBlocState(
      pageNumber: json['pageNumber'] as int? ?? 0,
      searchKeyword: json['searchKeyword'] as String? ?? 'man',
    );

Map<String, dynamic> _$MoviesBlocStateToJson(MoviesBlocState instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'searchKeyword': instance.searchKeyword,
    };
