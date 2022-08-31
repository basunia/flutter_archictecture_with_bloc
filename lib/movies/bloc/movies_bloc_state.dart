// part of 'movies_bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_api/model/movie.dart';

part 'movies_bloc_state.g.dart';

enum MovieStatus { initial, loading, success, failure }

@JsonSerializable()
class MoviesBlocState extends Equatable {
  const MoviesBlocState(
      {this.status = MovieStatus.initial,
      this.movies = const [],
      this.hasReachedMax = false,
      this.pageNumber = 0});

  @JsonKey(ignore: true)
  final List<Movie> movies;
  @JsonKey(ignore: true)
  final MovieStatus status;
  @JsonKey(ignore: true)
  final bool hasReachedMax;
  final int pageNumber;

  MoviesBlocState copyWith(
      {MovieStatus? status,
      List<Movie>? movies,
      bool? hasReachedMax,
      int? pageNumber}) {
    return MoviesBlocState(
        status: status ?? this.status,
        movies: movies ?? this.movies,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        pageNumber: pageNumber ?? this.pageNumber);
  }

  factory MoviesBlocState.fromJson(Map<String, dynamic> json) =>
      _$MoviesBlocStateFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesBlocStateToJson(this);

  @override
  List<Object> get props => [status, movies, hasReachedMax];
}
