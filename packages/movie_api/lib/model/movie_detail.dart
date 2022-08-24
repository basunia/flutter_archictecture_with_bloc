import 'package:floor/floor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// part 'movie_detail.freezed.dart';
part 'movie_detail.g.dart';

// @freezed
@JsonSerializable()
@entity
class MovieDetail {
  MovieDetail(
      {this.id,
      required this.imdbId,
      required this.title,
      required this.year,
      required this.released,
      required this.genre,
      required this.plot,
      required this.director,
      required this.imdbRating});

  @PrimaryKey(autoGenerate: true)
  @JsonKey(ignore: true)
  int? id;
  @JsonKey(name: 'imdbID')
  String imdbId;
  @JsonKey(name: 'Title')
  String title;
  @JsonKey(name: 'Year')
  String year;
  @JsonKey(name: 'Released')
  String released;
  @JsonKey(name: 'Genre')
  String genre;
  @JsonKey(name: 'Plot')
  String plot;
  @JsonKey(name: 'Director')
  String director;
  String imdbRating;

  factory MovieDetail.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailToJson(this);

  @override
  String toString() {
    return 'id $id, movieId $imdbId, Tittle $title, Genre $genre, Plot $plot, Director $director';
  }
}
