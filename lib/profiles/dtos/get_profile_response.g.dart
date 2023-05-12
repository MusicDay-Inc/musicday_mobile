// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProfileResponse _$GetProfileResponseFromJson(Map<String, dynamic> json) =>
    GetProfileResponse(
      isClientSubscribed: json['is_client_subscribed'] as bool,
      user: UserDto.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetProfileResponseToJson(GetProfileResponse instance) =>
    <String, dynamic>{
      'is_client_subscribed': instance.isClientSubscribed,
      'user': instance.user,
    };
