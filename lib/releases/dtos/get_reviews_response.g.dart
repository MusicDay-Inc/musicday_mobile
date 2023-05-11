// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_reviews_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetReviewsResponse _$GetReviewsResponseFromJson(Map<String, dynamic> json) =>
    GetReviewsResponse(
      meanScore: (json['mean_score'] as num).toDouble(),
      reviews: (json['reviews'] as List<dynamic>)
          .map((e) => UserReviewDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetReviewsResponseToJson(GetReviewsResponse instance) =>
    <String, dynamic>{
      'mean_score': instance.meanScore,
      'reviews': instance.reviews,
    };
