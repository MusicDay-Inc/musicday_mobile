import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:musicday_mobile/releases/dtos/user_review_dto.dart';

part 'get_reviews_response.g.dart';

@JsonSerializable()
class GetReviewsResponse {
  @JsonKey(name: "mean_score")
  final double meanScore;
  @JsonKey(name: "reviews")
  final List<UserReviewDto> reviews;

  GetReviewsResponse({
    required this.meanScore,
    required this.reviews,
  });

  Map<String, dynamic> toJson() => _$GetReviewsResponseToJson(this);

  factory GetReviewsResponse.fromJson(Map<String, dynamic> data) => _$GetReviewsResponseFromJson(data);
}
