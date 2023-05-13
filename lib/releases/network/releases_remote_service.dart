import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:musicday_mobile/auth/di/auth_named.dart';
import 'package:musicday_mobile/core/network/network_consts.dart';
import 'package:musicday_mobile/releases/dtos/album_by_id_response.dart';
import 'package:musicday_mobile/releases/dtos/album_search_entry.dart';
import 'package:musicday_mobile/releases/dtos/delete_review_response.dart';
import 'package:musicday_mobile/releases/dtos/get_reviews_response.dart';
import 'package:musicday_mobile/releases/dtos/send_review_request.dart';
import 'package:musicday_mobile/releases/dtos/send_review_response.dart';
import 'package:musicday_mobile/releases/dtos/song_by_id_response.dart';
import 'package:musicday_mobile/releases/dtos/song_search_entry.dart';
import 'package:retrofit/retrofit.dart';

part 'releases_remote_service.g.dart';

@RestApi(baseUrl: "${NetworkConsts.baseUrl}/")
abstract class ReleasesRemoteService {
  @Singleton(as: ReleasesRemoteService)
  @factoryMethod
  factory ReleasesRemoteService(@Named(AuthNamed.authorizedDio) Dio dio, {String baseUrl}) = _ReleasesRemoteService;

  @GET("user/song/{id}")
  Future<HttpResponse<SongByIdResponse>> getSongById(@Path("id") String id);

  @GET("user/album_info/{id}")
  Future<HttpResponse<AlbumByIdResponse>> getAlbumById(@Path("id") String id);

  @POST("action/review/{id}")
  Future<HttpResponse<SendReviewResponse>> sendReview(@Path("id") String id, @Body() SendReviewRequest body);

  @POST("action/delete_review/{id}")
  Future<HttpResponse<DeleteReviewResponse>> deleteReview(@Path("id") String id);

  @GET("reviews/to_release/{id}")
  Future<HttpResponse<GetReviewsResponse>> getReviews(@Path("id") String id);

  @GET("/search/album")
  Future<HttpResponse<List<AlbumSearchEntry>>> searchAlbums(
    @Query("query") String query,
    @Query("offset") int offset,
    @Query("limit") int limit,
  );

  @GET("/search/song")
  Future<HttpResponse<List<SongSearchEntry>>> searchSongs(
    @Query("query") String query,
    @Query("offset") int offset,
    @Query("limit") int limit,
  );
}
