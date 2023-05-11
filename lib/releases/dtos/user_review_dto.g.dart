// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_review_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserReviewDto _$UserReviewDtoFromJson(Map<String, dynamic> json) =>
    UserReviewDto(
      id: json['id'] as String,
      user: UserDto.fromJson(json['user'] as Map<String, dynamic>),
      publishedAt: DateTime.parse(json['published_at'] as String),
      text: json['review_text'] as String?,
      score: json['score'] as int?,
    );

Map<String, dynamic> _$UserReviewDtoToJson(UserReviewDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'published_at': instance.publishedAt.toIso8601String(),
      'review_text': instance.text,
      'score': instance.score,
    };
