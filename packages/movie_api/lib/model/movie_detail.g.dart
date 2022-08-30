// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetail _$MovieDetailFromJson(Map<String, dynamic> json) => MovieDetail(
      imdbId: json['imdbID'] as String,
      poster: json['Poster'] as String,
      title: json['Title'] as String,
      year: json['Year'] as String,
      released: json['Released'] as String,
      genre: json['Genre'] as String,
      plot: json['Plot'] as String,
      director: json['Director'] as String,
      imdbRating: json['imdbRating'] as String,
    );

Map<String, dynamic> _$MovieDetailToJson(MovieDetail instance) =>
    <String, dynamic>{
      'imdbID': instance.imdbId,
      'Poster': instance.poster,
      'Title': instance.title,
      'Year': instance.year,
      'Released': instance.released,
      'Genre': instance.genre,
      'Plot': instance.plot,
      'Director': instance.director,
      'imdbRating': instance.imdbRating,
    };
