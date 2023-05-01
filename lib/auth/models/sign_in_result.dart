import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_result.freezed.dart';

@freezed
class SignInResult with _$SignInResult {
  const factory SignInResult.success() = Success;
  const factory SignInResult.cancelled() = Cancelled;
  const factory SignInResult.serverError() = ServerError;
}
