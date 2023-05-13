// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityDto _$ActivityDtoFromJson(Map<String, dynamic> json) => ActivityDto(
      id: json['id'] as String,
      publishedAt: DateTime.parse(json['published_at'] as String),
      text: json['review_text'] as String?,
      score: json['score'] as int?,
      album: json['album'] == null
          ? null
          : AlbumDto.fromJson(json['album'] as Map<String, dynamic>),
      song: json['song'] == null
          ? null
          : SongDto.fromJson(json['song'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserDto.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ActivityDtoToJson(ActivityDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'published_at': instance.publishedAt.toIso8601String(),
      'review_text': instance.text,
      'score': instance.score,
      'album': instance.album,
      'song': instance.song,
      'user': instance.user,
    };
