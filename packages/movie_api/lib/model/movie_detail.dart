import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_detail.freezed.dart';
part 'movie_detail.g.dart';

@freezed
class MovieDetail with _$MovieDetail {
  const factory MovieDetail(
      {@JsonKey(name: 'Title') required String title,
      @JsonKey(name: 'Year') required String year,
      @JsonKey(name: 'Released') required String released,
      @JsonKey(name: 'Genre') required String genre,
      @JsonKey(name: 'Plot') required String plot,
      @JsonKey(name: 'Director') required String director,
      required String imdbRating}) = _MovieDetail;

  factory MovieDetail.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailFromJson(json);
}
