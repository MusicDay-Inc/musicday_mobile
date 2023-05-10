import 'package:freezed_annotation/freezed_annotation.dart';

part 'send_review_request.g.dart';

@JsonSerializable()
class SendReviewRequest {
  @JsonKey(name: "score")
  final int score;
  @JsonKey(name: "review_text")
  final String? text;

  SendReviewRequest({
    required this.score,
    required this.text,
  });

  Map<String, dynamic> toJson() => _$SendReviewRequestToJson(this);

  factory SendReviewRequest.fromJson(Map<String, dynamic> data) => _$SendReviewRequestFromJson(data);
}
