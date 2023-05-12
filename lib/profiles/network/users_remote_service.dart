import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:musicday_mobile/auth/di/auth_named.dart';
import 'package:musicday_mobile/core/network/network_consts.dart';
import 'package:musicday_mobile/profiles/di/profiles_scope.dart';
import 'package:musicday_mobile/profiles/dtos/activity_dto.dart';
import 'package:musicday_mobile/profiles/dtos/get_profile_response.dart';
import 'package:retrofit/retrofit.dart';

part 'users_remote_service.g.dart';

@RestApi(baseUrl: NetworkConsts.baseUrl)
abstract class UsersRemoteService {
  @Singleton(scope: ProfilesScope.name, as: UsersRemoteService)
  @factoryMethod
  factory UsersRemoteService(@Named(AuthNamed.authorizedDio) Dio dio, {String baseUrl}) = _UsersRemoteService;

  @GET("/profile/{id}")
  Future<HttpResponse<GetProfileResponse>> getProfile(@Path("id") String id);

  @POST("/action/subscribe/{id}")
  Future<HttpResponse<GetProfileResponse>> subscribe(@Path("id") String id);

  @POST("/action/unsubscribe/{id}")
  Future<HttpResponse<GetProfileResponse>> unsubscribe(@Path("id") String id);

  @GET("/library/all/{id}")
  Future<HttpResponse<List<ActivityDto>>> getLibraryAll(
    @Path("id") String id,
    @Query("offset") int offset,
    @Query("limit") int limit,
  );
}
