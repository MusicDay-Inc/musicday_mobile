import 'package:freezed_annotation/freezed_annotation.dart';

part 'intro_screen_event.freezed.dart';

@freezed
class IntroScreenEvent with _$IntroScreenEvent {
  const factory IntroScreenEvent.googleButtonClick() = GoogleButtonClick;
}
