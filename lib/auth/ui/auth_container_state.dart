import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_container_state.freezed.dart';

@freezed
class AuthContainerState with _$AuthContainerState {
  const factory AuthContainerState.nonAuthorized() = NonAuthorized;
  const factory AuthContainerState.inRegistration() = InRegistration;
  const factory AuthContainerState.authorized() = Authorized;
}
