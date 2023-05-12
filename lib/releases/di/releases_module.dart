import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:musicday_mobile/auth/di/auth_named.dart';
import 'package:musicday_mobile/releases/network/releases_remote_service.dart';

@module
abstract class ReleasesModule {
  @Singleton()
  ReleasesRemoteService provideReleasesRemoteService(@Named(AuthNamed.authorizedDio) Dio dio) =>
      ReleasesRemoteService(dio);
}
