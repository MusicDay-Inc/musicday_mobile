import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_screen_event.freezed.dart';

@freezed
class SignUpScreenEvent with _$SignUpScreenEvent {
  const factory SignUpScreenEvent.doneClick() = DoneClick;
}
