import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';

@freezed
class Session with _$Session {
  const factory Session({
    required String token,
    required bool isAuthorizationToken,
  }) = _Session;
}
