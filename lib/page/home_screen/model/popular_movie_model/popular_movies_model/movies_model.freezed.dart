// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'movies_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MoviesModel _$MoviesModelFromJson(Map<String, dynamic> json) {
  return _MoviesModel.fromJson(json);
}

/// @nodoc
mixin _$MoviesModel {
  List<String>? get categories => throw _privateConstructorUsedError;
  @JsonKey(name: 'enurl_srt')
  String? get enUrlSRT => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'khurl_srt')
  String? get khUrlSRT => throw _privateConstructorUsedError;
  @JsonKey(name: 'm3u8url_server1')
  String? get m3u8UrlServer1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'm3u8url_server2')
  String? get m3u8UrlServer2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'm3u8url_server3')
  String? get m3u8UrlServer3 => throw _privateConstructorUsedError;
  @JsonKey(name: 'movie_name')
  String? get movieName => throw _privateConstructorUsedError;
  String? get overview => throw _privateConstructorUsedError;
  String? get quality => throw _privateConstructorUsedError;
  double? get rate => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_date')
  String? get releaseDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'thumbnail_url')
  String? get thumbnailUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MoviesModelCopyWith<MoviesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoviesModelCopyWith<$Res> {
  factory $MoviesModelCopyWith(
          MoviesModel value, $Res Function(MoviesModel) then) =
      _$MoviesModelCopyWithImpl<$Res>;
  $Res call(
      {List<String>? categories,
      @JsonKey(name: 'enurl_srt') String? enUrlSRT,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'khurl_srt') String? khUrlSRT,
      @JsonKey(name: 'm3u8url_server1') String? m3u8UrlServer1,
      @JsonKey(name: 'm3u8url_server2') String? m3u8UrlServer2,
      @JsonKey(name: 'm3u8url_server3') String? m3u8UrlServer3,
      @JsonKey(name: 'movie_name') String? movieName,
      String? overview,
      String? quality,
      double? rate,
      @JsonKey(name: 'release_date') String? releaseDate,
      @JsonKey(name: 'thumbnail_url') String? thumbnailUrl});
}

/// @nodoc
class _$MoviesModelCopyWithImpl<$Res> implements $MoviesModelCopyWith<$Res> {
  _$MoviesModelCopyWithImpl(this._value, this._then);

  final MoviesModel _value;
  // ignore: unused_field
  final $Res Function(MoviesModel) _then;

  @override
  $Res call({
    Object? categories = freezed,
    Object? enUrlSRT = freezed,
    Object? imageUrl = freezed,
    Object? khUrlSRT = freezed,
    Object? m3u8UrlServer1 = freezed,
    Object? m3u8UrlServer2 = freezed,
    Object? m3u8UrlServer3 = freezed,
    Object? movieName = freezed,
    Object? overview = freezed,
    Object? quality = freezed,
    Object? rate = freezed,
    Object? releaseDate = freezed,
    Object? thumbnailUrl = freezed,
  }) {
    return _then(_value.copyWith(
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      enUrlSRT: enUrlSRT == freezed
          ? _value.enUrlSRT
          : enUrlSRT // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      khUrlSRT: khUrlSRT == freezed
          ? _value.khUrlSRT
          : khUrlSRT // ignore: cast_nullable_to_non_nullable
              as String?,
      m3u8UrlServer1: m3u8UrlServer1 == freezed
          ? _value.m3u8UrlServer1
          : m3u8UrlServer1 // ignore: cast_nullable_to_non_nullable
              as String?,
      m3u8UrlServer2: m3u8UrlServer2 == freezed
          ? _value.m3u8UrlServer2
          : m3u8UrlServer2 // ignore: cast_nullable_to_non_nullable
              as String?,
      m3u8UrlServer3: m3u8UrlServer3 == freezed
          ? _value.m3u8UrlServer3
          : m3u8UrlServer3 // ignore: cast_nullable_to_non_nullable
              as String?,
      movieName: movieName == freezed
          ? _value.movieName
          : movieName // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: overview == freezed
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      quality: quality == freezed
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String?,
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double?,
      releaseDate: releaseDate == freezed
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: thumbnailUrl == freezed
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_MoviesModelCopyWith<$Res>
    implements $MoviesModelCopyWith<$Res> {
  factory _$$_MoviesModelCopyWith(
          _$_MoviesModel value, $Res Function(_$_MoviesModel) then) =
      __$$_MoviesModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<String>? categories,
      @JsonKey(name: 'enurl_srt') String? enUrlSRT,
      @JsonKey(name: 'image_url') String? imageUrl,
      @JsonKey(name: 'khurl_srt') String? khUrlSRT,
      @JsonKey(name: 'm3u8url_server1') String? m3u8UrlServer1,
      @JsonKey(name: 'm3u8url_server2') String? m3u8UrlServer2,
      @JsonKey(name: 'm3u8url_server3') String? m3u8UrlServer3,
      @JsonKey(name: 'movie_name') String? movieName,
      String? overview,
      String? quality,
      double? rate,
      @JsonKey(name: 'release_date') String? releaseDate,
      @JsonKey(name: 'thumbnail_url') String? thumbnailUrl});
}

/// @nodoc
class __$$_MoviesModelCopyWithImpl<$Res> extends _$MoviesModelCopyWithImpl<$Res>
    implements _$$_MoviesModelCopyWith<$Res> {
  __$$_MoviesModelCopyWithImpl(
      _$_MoviesModel _value, $Res Function(_$_MoviesModel) _then)
      : super(_value, (v) => _then(v as _$_MoviesModel));

  @override
  _$_MoviesModel get _value => super._value as _$_MoviesModel;

  @override
  $Res call({
    Object? categories = freezed,
    Object? enUrlSRT = freezed,
    Object? imageUrl = freezed,
    Object? khUrlSRT = freezed,
    Object? m3u8UrlServer1 = freezed,
    Object? m3u8UrlServer2 = freezed,
    Object? m3u8UrlServer3 = freezed,
    Object? movieName = freezed,
    Object? overview = freezed,
    Object? quality = freezed,
    Object? rate = freezed,
    Object? releaseDate = freezed,
    Object? thumbnailUrl = freezed,
  }) {
    return _then(_$_MoviesModel(
      categories: categories == freezed
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      enUrlSRT: enUrlSRT == freezed
          ? _value.enUrlSRT
          : enUrlSRT // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      khUrlSRT: khUrlSRT == freezed
          ? _value.khUrlSRT
          : khUrlSRT // ignore: cast_nullable_to_non_nullable
              as String?,
      m3u8UrlServer1: m3u8UrlServer1 == freezed
          ? _value.m3u8UrlServer1
          : m3u8UrlServer1 // ignore: cast_nullable_to_non_nullable
              as String?,
      m3u8UrlServer2: m3u8UrlServer2 == freezed
          ? _value.m3u8UrlServer2
          : m3u8UrlServer2 // ignore: cast_nullable_to_non_nullable
              as String?,
      m3u8UrlServer3: m3u8UrlServer3 == freezed
          ? _value.m3u8UrlServer3
          : m3u8UrlServer3 // ignore: cast_nullable_to_non_nullable
              as String?,
      movieName: movieName == freezed
          ? _value.movieName
          : movieName // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: overview == freezed
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String?,
      quality: quality == freezed
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String?,
      rate: rate == freezed
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as double?,
      releaseDate: releaseDate == freezed
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnailUrl: thumbnailUrl == freezed
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MoviesModel implements _MoviesModel {
  const _$_MoviesModel(
      {final List<String>? categories,
      @JsonKey(name: 'enurl_srt') this.enUrlSRT,
      @JsonKey(name: 'image_url') this.imageUrl,
      @JsonKey(name: 'khurl_srt') this.khUrlSRT,
      @JsonKey(name: 'm3u8url_server1') this.m3u8UrlServer1,
      @JsonKey(name: 'm3u8url_server2') this.m3u8UrlServer2,
      @JsonKey(name: 'm3u8url_server3') this.m3u8UrlServer3,
      @JsonKey(name: 'movie_name') this.movieName,
      this.overview,
      this.quality,
      this.rate,
      @JsonKey(name: 'release_date') this.releaseDate,
      @JsonKey(name: 'thumbnail_url') this.thumbnailUrl})
      : _categories = categories;

  factory _$_MoviesModel.fromJson(Map<String, dynamic> json) =>
      _$$_MoviesModelFromJson(json);

  final List<String>? _categories;
  @override
  List<String>? get categories {
    final value = _categories;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'enurl_srt')
  final String? enUrlSRT;
  @override
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  @override
  @JsonKey(name: 'khurl_srt')
  final String? khUrlSRT;
  @override
  @JsonKey(name: 'm3u8url_server1')
  final String? m3u8UrlServer1;
  @override
  @JsonKey(name: 'm3u8url_server2')
  final String? m3u8UrlServer2;
  @override
  @JsonKey(name: 'm3u8url_server3')
  final String? m3u8UrlServer3;
  @override
  @JsonKey(name: 'movie_name')
  final String? movieName;
  @override
  final String? overview;
  @override
  final String? quality;
  @override
  final double? rate;
  @override
  @JsonKey(name: 'release_date')
  final String? releaseDate;
  @override
  @JsonKey(name: 'thumbnail_url')
  final String? thumbnailUrl;

  @override
  String toString() {
    return 'MoviesModel(categories: $categories, enUrlSRT: $enUrlSRT, imageUrl: $imageUrl, khUrlSRT: $khUrlSRT, m3u8UrlServer1: $m3u8UrlServer1, m3u8UrlServer2: $m3u8UrlServer2, m3u8UrlServer3: $m3u8UrlServer3, movieName: $movieName, overview: $overview, quality: $quality, rate: $rate, releaseDate: $releaseDate, thumbnailUrl: $thumbnailUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MoviesModel &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other.enUrlSRT, enUrlSRT) &&
            const DeepCollectionEquality().equals(other.imageUrl, imageUrl) &&
            const DeepCollectionEquality().equals(other.khUrlSRT, khUrlSRT) &&
            const DeepCollectionEquality()
                .equals(other.m3u8UrlServer1, m3u8UrlServer1) &&
            const DeepCollectionEquality()
                .equals(other.m3u8UrlServer2, m3u8UrlServer2) &&
            const DeepCollectionEquality()
                .equals(other.m3u8UrlServer3, m3u8UrlServer3) &&
            const DeepCollectionEquality().equals(other.movieName, movieName) &&
            const DeepCollectionEquality().equals(other.overview, overview) &&
            const DeepCollectionEquality().equals(other.quality, quality) &&
            const DeepCollectionEquality().equals(other.rate, rate) &&
            const DeepCollectionEquality()
                .equals(other.releaseDate, releaseDate) &&
            const DeepCollectionEquality()
                .equals(other.thumbnailUrl, thumbnailUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(enUrlSRT),
      const DeepCollectionEquality().hash(imageUrl),
      const DeepCollectionEquality().hash(khUrlSRT),
      const DeepCollectionEquality().hash(m3u8UrlServer1),
      const DeepCollectionEquality().hash(m3u8UrlServer2),
      const DeepCollectionEquality().hash(m3u8UrlServer3),
      const DeepCollectionEquality().hash(movieName),
      const DeepCollectionEquality().hash(overview),
      const DeepCollectionEquality().hash(quality),
      const DeepCollectionEquality().hash(rate),
      const DeepCollectionEquality().hash(releaseDate),
      const DeepCollectionEquality().hash(thumbnailUrl));

  @JsonKey(ignore: true)
  @override
  _$$_MoviesModelCopyWith<_$_MoviesModel> get copyWith =>
      __$$_MoviesModelCopyWithImpl<_$_MoviesModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MoviesModelToJson(this);
  }
}

abstract class _MoviesModel implements MoviesModel {
  const factory _MoviesModel(
          {final List<String>? categories,
          @JsonKey(name: 'enurl_srt') final String? enUrlSRT,
          @JsonKey(name: 'image_url') final String? imageUrl,
          @JsonKey(name: 'khurl_srt') final String? khUrlSRT,
          @JsonKey(name: 'm3u8url_server1') final String? m3u8UrlServer1,
          @JsonKey(name: 'm3u8url_server2') final String? m3u8UrlServer2,
          @JsonKey(name: 'm3u8url_server3') final String? m3u8UrlServer3,
          @JsonKey(name: 'movie_name') final String? movieName,
          final String? overview,
          final String? quality,
          final double? rate,
          @JsonKey(name: 'release_date') final String? releaseDate,
          @JsonKey(name: 'thumbnail_url') final String? thumbnailUrl}) =
      _$_MoviesModel;

  factory _MoviesModel.fromJson(Map<String, dynamic> json) =
      _$_MoviesModel.fromJson;

  @override
  List<String>? get categories => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'enurl_srt')
  String? get enUrlSRT => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'image_url')
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'khurl_srt')
  String? get khUrlSRT => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'm3u8url_server1')
  String? get m3u8UrlServer1 => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'm3u8url_server2')
  String? get m3u8UrlServer2 => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'm3u8url_server3')
  String? get m3u8UrlServer3 => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'movie_name')
  String? get movieName => throw _privateConstructorUsedError;
  @override
  String? get overview => throw _privateConstructorUsedError;
  @override
  String? get quality => throw _privateConstructorUsedError;
  @override
  double? get rate => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'release_date')
  String? get releaseDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'thumbnail_url')
  String? get thumbnailUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MoviesModelCopyWith<_$_MoviesModel> get copyWith =>
      throw _privateConstructorUsedError;
}
