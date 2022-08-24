import 'package:floor/floor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// part 'movie.freezed.dart';
part 'movie.g.dart';

@entity
@JsonSerializable()
class Movie {
  Movie({
    this.id,
    required this.title,
    required this.year,
    required this.imdbId,
    required this.poster,
  });

  @PrimaryKey(autoGenerate: true)
  @JsonKey(ignore: true)
  int? id;
  @JsonKey(name: 'Title')
  String title;
  @JsonKey(name: 'Year')
  String year;
  @JsonKey(name: 'imdbID')
  String imdbId;
  @JsonKey(name: 'Poster')
  String poster;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  @override
  String toString() {
    return 'id $id, Title $title, Year of Release $year, imdbId $imdbId';
  }
}
