import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:musicday_mobile/auth/di/auth_scope.dart';
import 'package:musicday_mobile/auth/network/auth_remote_service.dart';

@module
abstract class AuthModule {
  @Scope(AuthScope.name)
  GoogleSignIn provideGoogleSignIn() => GoogleSignIn(scopes: ["email"]);

  @Scope(AuthScope.name)
  AuthRemoteService provideAuthRemoteService(Dio dio) {
    return AuthRemoteService(dio);
  }
}
