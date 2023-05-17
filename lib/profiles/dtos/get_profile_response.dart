import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:musicday_mobile/profiles/dtos/user_dto.dart';

part 'get_profile_response.g.dart';

@JsonSerializable()
class GetProfileResponse {
  @JsonKey(name: "bio")
  final String bio;
  @JsonKey(name: "song_amount")
  final int songAmount;
  @JsonKey(name: "album_amount")
  final int albumAmount;
  @JsonKey(name: "is_client_subscribed")
  final bool isClientSubscribed;
  @JsonKey(name: "user")
  final UserDto user;

  GetProfileResponse({
    required this.songAmount,
    required this.albumAmount,
    required this.isClientSubscribed,
    required this.user,
    required this.bio,
  });

  factory GetProfileResponse.fromJson(Map<String, dynamic> data) => _$GetProfileResponseFromJson(data);

  Map<String, dynamic> toJson() => _$GetProfileResponseToJson(this);
}
