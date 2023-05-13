// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewDto _$ReviewDtoFromJson(Map<String, dynamic> json) => ReviewDto(
      id: json['id'] as String,
      publishedAt: DateTime.parse(json['published_at'] as String),
      text: json['review_text'] as String?,
      score: json['score'] as int?,
    );

Map<String, dynamic> _$ReviewDtoToJson(ReviewDto instance) => <String, dynamic>{
      'id': instance.id,
      'published_at': instance.publishedAt.toIso8601String(),
      'review_text': instance.text,
      'score': instance.score,
    };
