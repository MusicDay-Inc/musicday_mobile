import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:musicday_mobile/profiles/models/user.dart';
import 'package:musicday_mobile/releases/models/activity.dart';

part 'profile_info_state.freezed.dart';

@freezed
class ProfileInfoState with _$ProfileInfoState {
  const factory ProfileInfoState.loading() = Loading;
  const factory ProfileInfoState.data(User user, List<Activity> reviews, bool reviewsLoading) = Data;
}
