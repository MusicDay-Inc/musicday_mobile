import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:musicday_mobile/auth/di/auth_named.dart';
import 'package:musicday_mobile/profiles/network/users_remote_service.dart';

@module
abstract class ProfilesModule {
  @Singleton()
  UsersRemoteService provideUsersRemoteService(@Named(AuthNamed.authorizedDio) Dio dio) => UsersRemoteService(dio);
}
