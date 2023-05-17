// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProfileResponse _$GetProfileResponseFromJson(Map<String, dynamic> json) =>
    GetProfileResponse(
      songAmount: json['song_amount'] as int,
      albumAmount: json['album_amount'] as int,
      isClientSubscribed: json['is_client_subscribed'] as bool,
      user: UserDto.fromJson(json['user'] as Map<String, dynamic>),
      bio: json['bio'] as String,
    );

Map<String, dynamic> _$GetProfileResponseToJson(GetProfileResponse instance) =>
    <String, dynamic>{
      'bio': instance.bio,
      'song_amount': instance.songAmount,
      'album_amount': instance.albumAmount,
      'is_client_subscribed': instance.isClientSubscribed,
      'user': instance.user,
    };
