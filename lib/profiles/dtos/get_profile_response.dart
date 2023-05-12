import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:musicday_mobile/profiles/dtos/user_dto.dart';

part 'get_profile_response.g.dart';

@JsonSerializable()
class GetProfileResponse {
  @JsonKey(name: "is_client_subscribed")
  final bool isClientSubscribed;
  @JsonKey(name: "user")
  final UserDto user;

  GetProfileResponse({
    required this.isClientSubscribed,
    required this.user,
  });

  factory GetProfileResponse.fromJson(Map<String, dynamic> data) => _$GetProfileResponseFromJson(data);

  Map<String, dynamic> toJson() => _$GetProfileResponseToJson(this);
}
