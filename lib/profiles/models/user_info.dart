import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.freezed.dart';

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    required String bio,
    required bool isSubscribed,
    required int albumAmount,
    required int songAmount,
  }) = _UserInfo;
}
