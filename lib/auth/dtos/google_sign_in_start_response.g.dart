// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_sign_in_start_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoogleSignInStartResponse _$GoogleSignInStartResponseFromJson(
        Map<String, dynamic> json) =>
    GoogleSignInStartResponse(
      jwtToken: json['jwt_token'] as String,
      isRegistered: json['is_registered'] as bool,
    );

Map<String, dynamic> _$GoogleSignInStartResponseToJson(
        GoogleSignInStartResponse instance) =>
    <String, dynamic>{
      'jwt_token': instance.jwtToken,
      'is_registered': instance.isRegistered,
    };
