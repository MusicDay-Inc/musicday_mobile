import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:musicday_mobile/profiles/models/user.dart';
import 'package:musicday_mobile/releases/models/review.dart';

part 'user_review.freezed.dart';

@freezed
class UserReview with _$UserReview {
  const factory UserReview({
    required Review review,
    required User user,
  }) = _UserReview;
}
