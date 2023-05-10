// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_review_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendReviewRequest _$SendReviewRequestFromJson(Map<String, dynamic> json) =>
    SendReviewRequest(
      score: json['score'] as int,
      text: json['review_text'] as String?,
    );

Map<String, dynamic> _$SendReviewRequestToJson(SendReviewRequest instance) =>
    <String, dynamic>{
      'score': instance.score,
      'review_text': instance.text,
    };
