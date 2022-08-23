// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'movie_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MovieDetail _$MovieDetailFromJson(Map<String, dynamic> json) {
  return _MovieDetail.fromJson(json);
}

/// @nodoc
mixin _$MovieDetail {
  @JsonKey(name: 'Title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'Year')
  String get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'Released')
  String get released => throw _privateConstructorUsedError;
  @JsonKey(name: 'Genre')
  String get genre => throw _privateConstructorUsedError;
  @JsonKey(name: 'Plot')
  String get plot => throw _privateConstructorUsedError;
  @JsonKey(name: 'Director')
  String get director => throw _privateConstructorUsedError;
  String get imdbRating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieDetailCopyWith<MovieDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieDetailCopyWith<$Res> {
  factory $MovieDetailCopyWith(
          MovieDetail value, $Res Function(MovieDetail) then) =
      _$MovieDetailCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'Title') String title,
      @JsonKey(name: 'Year') String year,
      @JsonKey(name: 'Released') String released,
      @JsonKey(name: 'Genre') String genre,
      @JsonKey(name: 'Plot') String plot,
      @JsonKey(name: 'Director') String director,
      String imdbRating});
}

/// @nodoc
class _$MovieDetailCopyWithImpl<$Res> implements $MovieDetailCopyWith<$Res> {
  _$MovieDetailCopyWithImpl(this._value, this._then);

  final MovieDetail _value;
  // ignore: unused_field
  final $Res Function(MovieDetail) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? year = freezed,
    Object? released = freezed,
    Object? genre = freezed,
    Object? plot = freezed,
    Object? director = freezed,
    Object? imdbRating = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      released: released == freezed
          ? _value.released
          : released // ignore: cast_nullable_to_non_nullable
              as String,
      genre: genre == freezed
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String,
      plot: plot == freezed
          ? _value.plot
          : plot // ignore: cast_nullable_to_non_nullable
              as String,
      director: director == freezed
          ? _value.director
          : director // ignore: cast_nullable_to_non_nullable
              as String,
      imdbRating: imdbRating == freezed
          ? _value.imdbRating
          : imdbRating // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_MovieDetailCopyWith<$Res>
    implements $MovieDetailCopyWith<$Res> {
  factory _$$_MovieDetailCopyWith(
          _$_MovieDetail value, $Res Function(_$_MovieDetail) then) =
      __$$_MovieDetailCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'Title') String title,
      @JsonKey(name: 'Year') String year,
      @JsonKey(name: 'Released') String released,
      @JsonKey(name: 'Genre') String genre,
      @JsonKey(name: 'Plot') String plot,
      @JsonKey(name: 'Director') String director,
      String imdbRating});
}

/// @nodoc
class __$$_MovieDetailCopyWithImpl<$Res> extends _$MovieDetailCopyWithImpl<$Res>
    implements _$$_MovieDetailCopyWith<$Res> {
  __$$_MovieDetailCopyWithImpl(
      _$_MovieDetail _value, $Res Function(_$_MovieDetail) _then)
      : super(_value, (v) => _then(v as _$_MovieDetail));

  @override
  _$_MovieDetail get _value => super._value as _$_MovieDetail;

  @override
  $Res call({
    Object? title = freezed,
    Object? year = freezed,
    Object? released = freezed,
    Object? genre = freezed,
    Object? plot = freezed,
    Object? director = freezed,
    Object? imdbRating = freezed,
  }) {
    return _then(_$_MovieDetail(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      year: year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      released: released == freezed
          ? _value.released
          : released // ignore: cast_nullable_to_non_nullable
              as String,
      genre: genre == freezed
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String,
      plot: plot == freezed
          ? _value.plot
          : plot // ignore: cast_nullable_to_non_nullable
              as String,
      director: director == freezed
          ? _value.director
          : director // ignore: cast_nullable_to_non_nullable
              as String,
      imdbRating: imdbRating == freezed
          ? _value.imdbRating
          : imdbRating // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MovieDetail with DiagnosticableTreeMixin implements _MovieDetail {
  const _$_MovieDetail(
      {@JsonKey(name: 'Title') required this.title,
      @JsonKey(name: 'Year') required this.year,
      @JsonKey(name: 'Released') required this.released,
      @JsonKey(name: 'Genre') required this.genre,
      @JsonKey(name: 'Plot') required this.plot,
      @JsonKey(name: 'Director') required this.director,
      required this.imdbRating});

  factory _$_MovieDetail.fromJson(Map<String, dynamic> json) =>
      _$$_MovieDetailFromJson(json);

  @override
  @JsonKey(name: 'Title')
  final String title;
  @override
  @JsonKey(name: 'Year')
  final String year;
  @override
  @JsonKey(name: 'Released')
  final String released;
  @override
  @JsonKey(name: 'Genre')
  final String genre;
  @override
  @JsonKey(name: 'Plot')
  final String plot;
  @override
  @JsonKey(name: 'Director')
  final String director;
  @override
  final String imdbRating;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MovieDetail(title: $title, year: $year, released: $released, genre: $genre, plot: $plot, director: $director, imdbRating: $imdbRating)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MovieDetail'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('year', year))
      ..add(DiagnosticsProperty('released', released))
      ..add(DiagnosticsProperty('genre', genre))
      ..add(DiagnosticsProperty('plot', plot))
      ..add(DiagnosticsProperty('director', director))
      ..add(DiagnosticsProperty('imdbRating', imdbRating));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MovieDetail &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.year, year) &&
            const DeepCollectionEquality().equals(other.released, released) &&
            const DeepCollectionEquality().equals(other.genre, genre) &&
            const DeepCollectionEquality().equals(other.plot, plot) &&
            const DeepCollectionEquality().equals(other.director, director) &&
            const DeepCollectionEquality()
                .equals(other.imdbRating, imdbRating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(year),
      const DeepCollectionEquality().hash(released),
      const DeepCollectionEquality().hash(genre),
      const DeepCollectionEquality().hash(plot),
      const DeepCollectionEquality().hash(director),
      const DeepCollectionEquality().hash(imdbRating));

  @JsonKey(ignore: true)
  @override
  _$$_MovieDetailCopyWith<_$_MovieDetail> get copyWith =>
      __$$_MovieDetailCopyWithImpl<_$_MovieDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MovieDetailToJson(
      this,
    );
  }
}

abstract class _MovieDetail implements MovieDetail {
  const factory _MovieDetail(
      {@JsonKey(name: 'Title') required final String title,
      @JsonKey(name: 'Year') required final String year,
      @JsonKey(name: 'Released') required final String released,
      @JsonKey(name: 'Genre') required final String genre,
      @JsonKey(name: 'Plot') required final String plot,
      @JsonKey(name: 'Director') required final String director,
      required final String imdbRating}) = _$_MovieDetail;

  factory _MovieDetail.fromJson(Map<String, dynamic> json) =
      _$_MovieDetail.fromJson;

  @override
  @JsonKey(name: 'Title')
  String get title;
  @override
  @JsonKey(name: 'Year')
  String get year;
  @override
  @JsonKey(name: 'Released')
  String get released;
  @override
  @JsonKey(name: 'Genre')
  String get genre;
  @override
  @JsonKey(name: 'Plot')
  String get plot;
  @override
  @JsonKey(name: 'Director')
  String get director;
  @override
  String get imdbRating;
  @override
  @JsonKey(ignore: true)
  _$$_MovieDetailCopyWith<_$_MovieDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
