// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MovieDetail _$$_MovieDetailFromJson(Map<String, dynamic> json) =>
    _$_MovieDetail(
      title: json['Title'] as String,
      year: json['Year'] as String,
      released: json['Released'] as String,
      genre: json['Genre'] as String,
      plot: json['Plot'] as String,
      director: json['Director'] as String,
      imdbRating: json['imdbRating'] as String,
    );

Map<String, dynamic> _$$_MovieDetailToJson(_$_MovieDetail instance) =>
    <String, dynamic>{
      'Title': instance.title,
      'Year': instance.year,
      'Released': instance.released,
      'Genre': instance.genre,
      'Plot': instance.plot,
      'Director': instance.director,
      'imdbRating': instance.imdbRating,
    };
