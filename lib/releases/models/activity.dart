import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:musicday_mobile/profiles/models/user.dart';
import 'package:musicday_mobile/releases/models/release.dart';
import 'package:musicday_mobile/releases/models/review.dart';

part 'activity.freezed.dart';

@freezed
class Activity with _$Activity {
  const factory Activity({
    required Release release,
    required Review review,
  }) = _Activity;
}

@freezed
class UserActivity with _$UserActivity {
  const factory UserActivity({
    required Activity activity,
    required User user,
  }) = _UserActivity;
}
