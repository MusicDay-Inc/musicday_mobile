import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  @JsonKey(name: "jwt_token")
  final String jwtToken;

  SignUpResponse({
    required this.jwtToken,
  });

  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);

  factory SignUpResponse.fromJson(Map<String, dynamic> data) => _$SignUpResponseFromJson(data);
}
