import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequest {
  @JsonKey(name: "jwt_token")
  final String jwtToken;
  @JsonKey(name: "nickname")
  final String nickname;
  @JsonKey(name: "username")
  final String username;

  SignUpRequest({
    required this.jwtToken,
    required this.nickname,
    required this.username,
  });

  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}
