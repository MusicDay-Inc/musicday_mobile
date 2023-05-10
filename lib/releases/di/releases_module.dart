import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:musicday_mobile/auth/di/auth_named.dart';
import 'package:musicday_mobile/releases/di/releases_scope.dart';
import 'package:musicday_mobile/releases/network/releases_remote_service.dart';

@module
abstract class ReleasesModule {
  @Singleton()
  @Scope(ReleasesScope.name)
  ReleasesRemoteService provideReleasesRemoteService(@Named(AuthNamed.authorizedDio) Dio dio) =>
      ReleasesRemoteService(dio);
}
