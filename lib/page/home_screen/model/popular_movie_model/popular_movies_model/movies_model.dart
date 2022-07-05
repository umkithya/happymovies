// ignore_for_file: non_constant_identifier_names, invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'movies_model.freezed.dart';
part 'movies_model.g.dart';

@freezed
class MoviesModel with _$MoviesModel {
  const factory MoviesModel({
    List<String>? categories,
   
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
    @JsonKey(name: 'thumbnail_url') String? thumbnailUrl,
    
  
    
   
   
    
  }) = _MoviesModel;
  factory MoviesModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesModelFromJson(json);
  
}
