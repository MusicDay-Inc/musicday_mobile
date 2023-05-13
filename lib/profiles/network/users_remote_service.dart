import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:musicday_mobile/auth/di/auth_named.dart';
import 'package:musicday_mobile/core/network/network_consts.dart';
import 'package:musicday_mobile/profiles/dtos/activity_dto.dart';
import 'package:musicday_mobile/profiles/dtos/get_profile_response.dart';
import 'package:musicday_mobile/profiles/dtos/user_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'users_remote_service.g.dart';

@RestApi(baseUrl: NetworkConsts.baseUrl)
abstract class UsersRemoteService {
  @Singleton(as: UsersRemoteService)
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

  @GET("/library/albums/{id}")
  Future<HttpResponse<List<ActivityDto>>> getLibraryAlbum(
    @Path("id") String id,
    @Query("offset") int offset,
    @Query("limit") int limit,
  );

  @GET("/library/songs/{id}")
  Future<HttpResponse<List<ActivityDto>>> getLibrarySong(
    @Path("id") String id,
    @Query("offset") int offset,
    @Query("limit") int limit,
  );

  @GET("/user/activity")
  Future<HttpResponse<List<ActivityDto>>> getFeed(
    @Query("offset") int offset,
    @Query("limit") int limit,
  );

  @GET("/profile/subscribers/{id}")
  Future<HttpResponse<List<UserDto>>> getSubscribers(
    @Path("id") String id,
    @Query("offset") int offset,
    @Query("limit") int limit,
  );

  @GET("/profile/subscriptions/{id}")
  Future<HttpResponse<List<UserDto>>> getSubscriptions(
    @Path("id") String id,
    @Query("offset") int offset,
    @Query("limit") int limit,
  );
}
