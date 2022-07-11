// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MoviesModel _$$_MoviesModelFromJson(Map<String, dynamic> json) =>
    _$_MoviesModel(
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      enUrlSRT: json['enurl_srt'] as String?,
      imageUrl: json['image_url'] as String?,
      khUrlSRT: json['khurl_srt'] as String?,
      m3u8UrlServer1: json['m3u8url_server1'] as String?,
      m3u8UrlServer2: json['m3u8url_server2'] as String?,
      m3u8UrlServer3: json['m3u8url_server3'] as String?,
      movieName: json['movie_name'] as String?,
      overview: json['overview'] as String?,
      quality: json['quality'] as String?,
      rate: (json['rate'] as num?)?.toDouble(),
      isFavourite: json['isFavourite'] as bool? ?? false,
      releaseDate: json['release_date'] as String?,
      thumbnailUrl: json['thumbnail_url'] as String?,
    );

Map<String, dynamic> _$$_MoviesModelToJson(_$_MoviesModel instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'enurl_srt': instance.enUrlSRT,
      'image_url': instance.imageUrl,
      'khurl_srt': instance.khUrlSRT,
      'm3u8url_server1': instance.m3u8UrlServer1,
      'm3u8url_server2': instance.m3u8UrlServer2,
      'm3u8url_server3': instance.m3u8UrlServer3,
      'movie_name': instance.movieName,
      'overview': instance.overview,
      'quality': instance.quality,
      'rate': instance.rate,
      'isFavourite': instance.isFavourite,
      'release_date': instance.releaseDate,
      'thumbnail_url': instance.thumbnailUrl,
    };
