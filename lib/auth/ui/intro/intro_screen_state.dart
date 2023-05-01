import 'package:freezed_annotation/freezed_annotation.dart';

part 'intro_screen_state.freezed.dart';

@freezed
class IntroScreenState with _$IntroScreenState {
  const factory IntroScreenState.idle() = Initial;
  const factory IntroScreenState.loading() = Loading;
  const factory IntroScreenState.serverError() = ServerError;
}
