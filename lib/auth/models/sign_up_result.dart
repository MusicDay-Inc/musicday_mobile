import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_result.freezed.dart';

@freezed
class SignUpResult with _$SignUpResult {
  const factory SignUpResult.invalidFormat(bool isNicknameInvalid, bool isUsernameInvalid) = InvalidFormat;
  const factory SignUpResult.serverError() = ServerError;
  const factory SignUpResult.success() = Success;
}
