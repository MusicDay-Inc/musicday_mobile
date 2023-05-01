import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:musicday_mobile/auth/di/auth_scope.dart';
import 'package:musicday_mobile/auth/dtos/google_sign_in_start_request.dart';
import 'package:musicday_mobile/auth/dtos/google_sign_in_start_response.dart';
import 'package:musicday_mobile/core/network/network_consts.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_remote_service.g.dart';

@RestApi(baseUrl: "${NetworkConsts.baseUrl}/auth")
abstract class AuthRemoteService {
  @Injectable(scope: AuthScope.name, as: AuthRemoteService)
  @factoryMethod
  factory AuthRemoteService(Dio dio, {String baseUrl}) = _AuthRemoteService;

  @POST("/start")
  Future<HttpResponse<GoogleSignInStartResponse>> startGoogleSignIn(@Body() GoogleSignInStartRequest request);
}
