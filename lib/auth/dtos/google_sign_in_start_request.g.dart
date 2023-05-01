// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_sign_in_start_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoogleSignInStartRequest _$GoogleSignInStartRequestFromJson(
        Map<String, dynamic> json) =>
    GoogleSignInStartRequest(
      idToken: json['id_token'] as String,
    );

Map<String, dynamic> _$GoogleSignInStartRequestToJson(
        GoogleSignInStartRequest instance) =>
    <String, dynamic>{
      'id_token': instance.idToken,
    };
