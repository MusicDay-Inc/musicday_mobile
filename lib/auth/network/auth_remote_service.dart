import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:musicday_mobile/auth/dtos/google_sign_in_start_request.dart';
import 'package:musicday_mobile/auth/dtos/google_sign_in_start_response.dart';
import 'package:musicday_mobile/auth/dtos/sign_up_request.dart';
import 'package:musicday_mobile/auth/dtos/sign_up_response.dart';
import 'package:musicday_mobile/core/network/network_consts.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_remote_service.g.dart';

@RestApi(baseUrl: "${NetworkConsts.baseUrl}/auth")
abstract class AuthRemoteService {
  @Singleton(as: AuthRemoteService)
  @factoryMethod
  factory AuthRemoteService(Dio dio, {String baseUrl}) = _AuthRemoteService;

  @POST("/start")
  Future<HttpResponse<GoogleSignInStartResponse>> startGoogleSignIn(@Body() GoogleSignInStartRequest request);

  @POST("/sign_up")
  Future<HttpResponse<SignUpResponse>> signUp(@Body() SignUpRequest request);
}
