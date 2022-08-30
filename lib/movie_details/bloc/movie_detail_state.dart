part of 'movie_detail_bloc.dart';

enum MovieDetailStatus { initial, loading, success, failure }

class MovieDetailState extends Equatable {
  const MovieDetailState(
      {this.movieDetail, this.movieDetailStatus = MovieDetailStatus.initial});

  final MovieDetail? movieDetail;
  final MovieDetailStatus movieDetailStatus;

  MovieDetailState copyWith(
      {MovieDetail? movieDetail, MovieDetailStatus? movieDetailStatus}) {
    return MovieDetailState(
      movieDetail: movieDetail ?? this.movieDetail,
      movieDetailStatus: movieDetailStatus ?? this.movieDetailStatus,
    );
  }

  @override
  List<Object?> get props => [movieDetail, movieDetailStatus];
}
