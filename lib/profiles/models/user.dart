import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String username,
    required String nickname,
    required String? avatarUrl,
    required int subscriberAmount,
    required int subscriptionsAmount,
  }) = _User;
}
