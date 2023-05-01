import 'package:json_annotation/json_annotation.dart';

part 'google_sign_in_start_response.g.dart';

@JsonSerializable()
class GoogleSignInStartResponse {
  @JsonKey(name: "jwt_token")
  final String jwtToken;
  @JsonKey(name: "is_registered")
  final bool isRegistered;

  GoogleSignInStartResponse({
    required this.jwtToken,
    required this.isRegistered,
  });

  factory GoogleSignInStartResponse.fromJson(Map<String, dynamic> data) => _$GoogleSignInStartResponseFromJson(data);
}
