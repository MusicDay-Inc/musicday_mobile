// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequest _$SignUpRequestFromJson(Map<String, dynamic> json) =>
    SignUpRequest(
      jwtToken: json['jwt_token'] as String,
      nickname: json['nickname'] as String,
      username: json['username'] as String,
    );

Map<String, dynamic> _$SignUpRequestToJson(SignUpRequest instance) =>
    <String, dynamic>{
      'jwt_token': instance.jwtToken,
      'nickname': instance.nickname,
      'username': instance.username,
    };
