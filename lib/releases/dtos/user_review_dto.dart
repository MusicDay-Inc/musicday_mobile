import 'package:json_annotation/json_annotation.dart';
import 'package:musicday_mobile/profiles/dtos/user_dto.dart';

part 'user_review_dto.g.dart';

@JsonSerializable()
class UserReviewDto {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "user")
  final UserDto user;
  @JsonKey(name: "published_at")
  final DateTime publishedAt;
  @JsonKey(name: "review_text")
  final String? text;
  @JsonKey(name: "score")
  final int? score;

  UserReviewDto({
    required this.id,
    required this.user,
    required this.publishedAt,
    required this.text,
    required this.score,
  });

  Map<String, dynamic> toJson() => _$UserReviewDtoToJson(this);

  factory UserReviewDto.fromJson(Map<String, dynamic> data) => _$UserReviewDtoFromJson(data);
}
