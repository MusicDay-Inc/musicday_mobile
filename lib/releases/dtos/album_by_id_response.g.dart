// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_by_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumByIdResponse _$AlbumByIdResponseFromJson(Map<String, dynamic> json) =>
    AlbumByIdResponse(
      album: AlbumDto.fromJson(json['album'] as Map<String, dynamic>),
      review: ReviewDto.fromJson(json['review'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AlbumByIdResponseToJson(AlbumByIdResponse instance) =>
    <String, dynamic>{
      'album': instance.album,
      'review': instance.review,
    };
