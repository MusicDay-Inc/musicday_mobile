// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_by_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SongByIdResponse _$SongByIdResponseFromJson(Map<String, dynamic> json) =>
    SongByIdResponse(
      song: SongDto.fromJson(json['song'] as Map<String, dynamic>),
      review: ReviewDto.fromJson(json['review'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SongByIdResponseToJson(SongByIdResponse instance) =>
    <String, dynamic>{
      'song': instance.song,
      'review': instance.review,
    };
