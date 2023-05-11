import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "username")
  final String username;
  @JsonKey(name: "nickname")
  final String nickname;
  @JsonKey(name: "has_picture")
  final bool hasPicture;
  @JsonKey(name: "subscriber_amount")
  final int subscriberAmount;
  @JsonKey(name: "subscription_amount")
  final int subscriptionsAmount;

  UserDto({
    required this.id,
    required this.username,
    required this.nickname,
    required this.hasPicture,
    required this.subscriberAmount,
    required this.subscriptionsAmount,
  });

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  factory UserDto.fromJson(Map<String, dynamic> data) => _$UserDtoFromJson(data);
}
