// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      id: json['id'] as String,
      username: json['username'] as String,
      nickname: json['nickname'] as String,
      hasPicture: json['has_picture'] as bool,
      subscriberAmount: json['subscriber_amount'] as int,
      subscriptionsAmount: json['subscription_amount'] as int,
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'nickname': instance.nickname,
      'has_picture': instance.hasPicture,
      'subscriber_amount': instance.subscriberAmount,
      'subscription_amount': instance.subscriptionsAmount,
    };
