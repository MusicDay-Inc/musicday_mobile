import 'package:json_annotation/json_annotation.dart';

part 'review_dto.g.dart';

@JsonSerializable()
class ReviewDto {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "user_id")
  final String userId;
  @JsonKey(name: "published_at")
  final DateTime publishedAt;
  @JsonKey(name: "review_text")
  final String? text;
  @JsonKey(name: "score")
  final int? score;

  ReviewDto({
    required this.id,
    required this.userId,
    required this.publishedAt,
    required this.text,
    required this.score,
  });

  Map<String, dynamic> toJson() => _$ReviewDtoToJson(this);

  factory ReviewDto.fromJson(Map<String, dynamic> data) => _$ReviewDtoFromJson(data);
}
