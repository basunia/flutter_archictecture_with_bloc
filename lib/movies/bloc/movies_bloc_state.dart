// part of 'movies_bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_api/model/movie.dart';

part 'movies_bloc_state.g.dart';

enum MovieStatus {
  initial,
  loading,
  success,
  failure,
  failureOnPagination,
  noConnection
}

extension MovieStatusX on MovieStatus {
  bool get isInitial => this == MovieStatus.initial;
  bool get isLoading => this == MovieStatus.loading;
  bool get isSuccess => this == MovieStatus.success;
  bool get isFailure => this == MovieStatus.failure;
  bool get isFailureOnPagination => this == MovieStatus.failureOnPagination;
  bool get isNoConnection => this == MovieStatus.noConnection;
}

@JsonSerializable()
class MoviesBlocState extends Equatable {
  const MoviesBlocState(
      {this.status = MovieStatus.initial,
      this.movies = const [],
      this.hasReachedMax = false,
      this.pageNumber = 0,
      this.searchKeyword = 'man'});

  @JsonKey(ignore: true)
  final List<Movie> movies;
  @JsonKey(ignore: true)
  final MovieStatus status;
  @JsonKey(ignore: true)
  final bool hasReachedMax;
  final int pageNumber;
  final String searchKeyword;

  MoviesBlocState copyWith(
      {MovieStatus? status,
      List<Movie>? movies,
      bool? hasReachedMax,
      int? pageNumber,
      String? searchKeyword}) {
    return MoviesBlocState(
        status: status ?? this.status,
        movies: movies ?? this.movies,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        pageNumber: pageNumber ?? this.pageNumber,
        searchKeyword: searchKeyword ?? this.searchKeyword);
  }

  factory MoviesBlocState.fromJson(Map<String, dynamic> json) =>
      _$MoviesBlocStateFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesBlocStateToJson(this);

  @override
  List<Object> get props => [status, movies, hasReachedMax];
}
