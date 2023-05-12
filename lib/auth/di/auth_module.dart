import 'package:dio/dio.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:musicday_mobile/auth/di/auth_named.dart';
import 'package:musicday_mobile/auth/interceptors/token_interceptor.dart';
import 'package:musicday_mobile/auth/network/auth_remote_service.dart';
import 'package:musicday_mobile/auth/repositories/auth_session_repository.dart';
import 'package:musicday_mobile/core/logging/logger_factory.dart';

@module
abstract class AuthModule {
  @Singleton()
  GoogleSignIn provideGoogleSignIn() => GoogleSignIn(scopes: ["email"]);

  @Singleton()
  AuthRemoteService provideAuthRemoteService(Dio dio) => AuthRemoteService(dio);

  @Singleton()
  @Named(AuthNamed.authorizedDio)
  Dio provideDio(AuthSessionRepository authSessionRepository, LoggerFactory loggerFactory) => Dio()
    ..interceptors.add(TokenInterceptor(authSessionRepository: authSessionRepository, loggerFactory: loggerFactory));
}
