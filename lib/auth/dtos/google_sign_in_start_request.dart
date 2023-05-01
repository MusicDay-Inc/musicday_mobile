import 'package:json_annotation/json_annotation.dart';

part 'google_sign_in_start_request.g.dart';

@JsonSerializable()
class GoogleSignInStartRequest {
  @JsonKey(name: "id_token")
  final String idToken;

  GoogleSignInStartRequest({
    required this.idToken,
  });

  Map<String, dynamic> toJson() => _$GoogleSignInStartRequestToJson(this);
}
