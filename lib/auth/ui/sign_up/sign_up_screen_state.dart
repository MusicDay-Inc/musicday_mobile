import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_screen_state.freezed.dart';

@freezed
class SignUpScreenState with _$SignUpScreenState {
  const factory SignUpScreenState.idle() = Idle;
  const factory SignUpScreenState.loading() = Loading;
  const factory SignUpScreenState.serverError() = ServerError;
  const factory SignUpScreenState.invalidFormat(bool isNicknameInvalid, bool isUsernameInvalid) = InvalidFormat;
}
