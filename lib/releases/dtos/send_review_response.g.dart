// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_review_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendReviewResponse _$SendReviewResponseFromJson(Map<String, dynamic> json) =>
    SendReviewResponse(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      publishedAt: DateTime.parse(json['published_at'] as String),
      text: json['review_text'] as String?,
      score: json['score'] as int?,
      album: json['album'] == null
          ? null
          : AlbumDto.fromJson(json['album'] as Map<String, dynamic>),
      song: json['song'] == null
          ? null
          : SongDto.fromJson(json['song'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SendReviewResponseToJson(SendReviewResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'published_at': instance.publishedAt.toIso8601String(),
      'review_text': instance.text,
      'score': instance.score,
      'album': instance.album,
      'song': instance.song,
    };
