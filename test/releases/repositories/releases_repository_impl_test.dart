import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:musicday_mobile/core/common/pair.dart';
import 'package:musicday_mobile/core/logging/logger.dart';
import 'package:musicday_mobile/core/logging/logger_factory.dart';
import 'package:musicday_mobile/core/network/dtos/error_response.dart';
import 'package:musicday_mobile/core/paging/factory/paged_response_factory.dart';
import 'package:musicday_mobile/profiles/converters/user_dto_converter.dart';
import 'package:musicday_mobile/profiles/dtos/user_dto.dart';
import 'package:musicday_mobile/profiles/models/user.dart';
import 'package:musicday_mobile/releases/dtos/album_by_id_response.dart';
import 'package:musicday_mobile/releases/dtos/album_dto.dart';
import 'package:musicday_mobile/releases/dtos/delete_review_response.dart';
import 'package:musicday_mobile/releases/dtos/get_reviews_response.dart';
import 'package:musicday_mobile/releases/dtos/review_dto.dart';
import 'package:musicday_mobile/releases/dtos/send_review_response.dart';
import 'package:musicday_mobile/releases/dtos/song_by_id_response.dart';
import 'package:musicday_mobile/releases/dtos/song_dto.dart';
import 'package:musicday_mobile/releases/dtos/user_review_dto.dart';
import 'package:musicday_mobile/releases/models/album.dart';
import 'package:musicday_mobile/releases/models/review.dart';
import 'package:musicday_mobile/releases/models/song.dart';
import 'package:musicday_mobile/releases/models/user_review.dart';
import 'package:musicday_mobile/releases/network/releases_remote_service.dart';
import 'package:musicday_mobile/releases/repositories/releases_repository_impl.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rxdart/rxdart.dart';
import 'releases_repository_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<PagedResponseFactory>(),
  MockSpec<ReleasesRemoteService>(),
  MockSpec<LoggerFactory>(),
  MockSpec<Logger>(),
])
void main() {
  final userDtoConverter = UserDtoConverter();
  final loggerFactory = MockLoggerFactory();
  when(loggerFactory.create(any)).thenReturn(MockLogger());

  group("getSongById", () {
    test("If server returns error during song request, stream emits null & closes", () async {
      final service = MockReleasesRemoteService();
      when(service.getSongById(any)).thenAnswer((realInvocation) async => throw DioError.badResponse(
          statusCode: HttpStatus.badRequest,
          requestOptions: RequestOptions(),
          response:
              Response(data: ErrorResponse(code: 1, message: "Stub!").toJson(), requestOptions: RequestOptions())));

      final pagedResponseFactory = MockPagedResponseFactory();
      final repository = ReleasesRepositoryImpl(
          releasesRemoteService: service,
          loggerFactory: loggerFactory,
          pagedResponseFactory: pagedResponseFactory,
          userDtoConverter: userDtoConverter);
      final events = await repository.getSongById("stub").toList();
      expect(events, [null]);
    });

    test("Song correctly mapped from DTO during song request", () async {
      final service = MockReleasesRemoteService();
      when(service.getSongById(any)).thenAnswer((realInvocation) async {
        return HttpResponse(
          SongByIdResponse(
            song: SongDto(
              id: "stub_id",
              name: "stub_name",
              author: "stub_author",
              date: DateTime.fromMillisecondsSinceEpoch(0),
              durationInNanoseconds: 1000000000,
            ),
            review: ReviewDto(
              id: '0',
              publishedAt: DateTime.now(),
              text: null,
              score: null,
            ),
          ),
          Response(requestOptions: RequestOptions()),
        );
      });

      final pagedResponseFactory = MockPagedResponseFactory();
      final repository = ReleasesRepositoryImpl(
          releasesRemoteService: service,
          loggerFactory: loggerFactory,
          pagedResponseFactory: pagedResponseFactory,
          userDtoConverter: userDtoConverter);
      final pair = await repository.getSongById("stub_id").first;
      expect(
        pair?.first,
        const Song(
          id: "stub_id",
          name: "stub_name",
          author: "stub_author",
          durationInSeconds: 1,
          avatarUrl: null,
          year: 1970,
        ),
      );
    });

    test("If server returns record without review during song request, review in pair == null", () async {
      final service = MockReleasesRemoteService();
      when(service.getSongById(any)).thenAnswer((realInvocation) async {
        return HttpResponse(
          SongByIdResponse(
            song: SongDto(
              id: "stub",
              name: "stub",
              author: "stub",
              date: DateTime.now(),
              durationInNanoseconds: 1000000000,
            ),
            review: ReviewDto(
              id: '0',
              publishedAt: DateTime.now(),
              text: null,
              score: null,
            ),
          ),
          Response(requestOptions: RequestOptions()),
        );
      });

      final pagedResponseFactory = MockPagedResponseFactory();
      final repository = ReleasesRepositoryImpl(
          releasesRemoteService: service,
          loggerFactory: loggerFactory,
          pagedResponseFactory: pagedResponseFactory,
          userDtoConverter: userDtoConverter);
      final pair = await repository.getSongById("stub").first;
      expect(pair?.second, null);
    });

    test("If server returns record only with rating during song request, review in pair != null", () async {
      final service = MockReleasesRemoteService();
      when(service.getSongById(any)).thenAnswer((realInvocation) async {
        return HttpResponse(
          SongByIdResponse(
            song: SongDto(
              id: "stub",
              name: "stub",
              author: "stub",
              date: DateTime.now(),
              durationInNanoseconds: 1000000000,
            ),
            review: ReviewDto(
              id: 'review_stub',
              publishedAt: DateTime.fromMillisecondsSinceEpoch(0),
              text: null,
              score: 4,
            ),
          ),
          Response(requestOptions: RequestOptions()),
        );
      });

      final pagedResponseFactory = MockPagedResponseFactory();
      final repository = ReleasesRepositoryImpl(
          releasesRemoteService: service,
          loggerFactory: loggerFactory,
          pagedResponseFactory: pagedResponseFactory,
          userDtoConverter: userDtoConverter);
      final pair = await repository.getSongById("stub").first;
      expect(pair?.second,
          Review(id: "review_stub", text: "", publishTime: DateTime.fromMillisecondsSinceEpoch(0), rating: 4));
    });

    test("If server returns record with review with text during song request, review in pair != null", () async {
      final service = MockReleasesRemoteService();
      when(service.getSongById(any)).thenAnswer((realInvocation) async {
        return HttpResponse(
          SongByIdResponse(
            song: SongDto(
              id: "stub",
              name: "stub",
              author: "stub",
              date: DateTime.now(),
              durationInNanoseconds: 1000000000,
            ),
            review: ReviewDto(
              id: 'review_stub',
              publishedAt: DateTime.fromMillisecondsSinceEpoch(0),
              text: "review_stub",
              score: 4,
            ),
          ),
          Response(requestOptions: RequestOptions()),
        );
      });

      final pagedResponseFactory = MockPagedResponseFactory();
      final repository = ReleasesRepositoryImpl(
          releasesRemoteService: service,
          loggerFactory: loggerFactory,
          pagedResponseFactory: pagedResponseFactory,
          userDtoConverter: userDtoConverter);
      final pair = await repository.getSongById("stub").first;
      expect(
          pair?.second,
          Review(
              id: "review_stub", text: "review_stub", publishTime: DateTime.fromMillisecondsSinceEpoch(0), rating: 4));
    });
  });

  group("getAlbumById", () {
    test("If server returns error during song request, stream emits null & closes", () async {
      final service = MockReleasesRemoteService();
      when(service.getAlbumById(any)).thenAnswer((realInvocation) async => throw DioError.badResponse(
          statusCode: HttpStatus.badRequest,
          requestOptions: RequestOptions(),
          response:
              Response(data: ErrorResponse(code: 1, message: "Stub!").toJson(), requestOptions: RequestOptions())));

      final pagedResponseFactory = MockPagedResponseFactory();
      final repository = ReleasesRepositoryImpl(
          releasesRemoteService: service,
          loggerFactory: loggerFactory,
          pagedResponseFactory: pagedResponseFactory,
          userDtoConverter: userDtoConverter);
      final events = await repository.getAlbumById("stub").toList();
      expect(events, [null]);
    });

    test("Song correctly mapped from DTO during song request", () async {
      final service = MockReleasesRemoteService();
      when(service.getAlbumById(any)).thenAnswer((realInvocation) async {
        return HttpResponse(
          AlbumByIdResponse(
            album: AlbumDto(
              id: "stub_id",
              name: "stub_name",
              author: "stub_author",
              date: DateTime.fromMillisecondsSinceEpoch(0),
              songsCount: 12,
            ),
            review: ReviewDto(
              id: '0',
              publishedAt: DateTime.now(),
              text: null,
              score: null,
            ),
          ),
          Response(requestOptions: RequestOptions()),
        );
      });

      final pagedResponseFactory = MockPagedResponseFactory();
      final repository = ReleasesRepositoryImpl(
          releasesRemoteService: service,
          loggerFactory: loggerFactory,
          pagedResponseFactory: pagedResponseFactory,
          userDtoConverter: userDtoConverter);
      final pair = await repository.getAlbumById("stub_id").first;
      expect(
        pair?.first,
        const Album(
          id: "stub_id",
          name: "stub_name",
          author: "stub_author",
          songsCount: 12,
          avatarUrl: null,
          year: 1970,
        ),
      );
    });

    test("If server returns record without review during song request, review in pair == null", () async {
      final service = MockReleasesRemoteService();
      when(service.getAlbumById(any)).thenAnswer((realInvocation) async {
        return HttpResponse(
          AlbumByIdResponse(
            album: AlbumDto(
              id: "stub",
              name: "stub",
              author: "stub",
              date: DateTime.now(),
              songsCount: 12,
            ),
            review: ReviewDto(
              id: '0',
              publishedAt: DateTime.now(),
              text: null,
              score: null,
            ),
          ),
          Response(requestOptions: RequestOptions()),
        );
      });

      final pagedResponseFactory = MockPagedResponseFactory();
      final repository = ReleasesRepositoryImpl(
          releasesRemoteService: service,
          loggerFactory: loggerFactory,
          pagedResponseFactory: pagedResponseFactory,
          userDtoConverter: userDtoConverter);
      final pair = await repository.getAlbumById("stub").first;
      expect(pair?.second, null);
    });

    test("If server returns record only with rating during song request, review in pair != null", () async {
      final service = MockReleasesRemoteService();
      when(service.getAlbumById(any)).thenAnswer((realInvocation) async {
        return HttpResponse(
          AlbumByIdResponse(
            album: AlbumDto(
              id: "stub",
              name: "stub",
              author: "stub",
              date: DateTime.now(),
              songsCount: 12,
            ),
            review: ReviewDto(
              id: 'review_stub',
              publishedAt: DateTime.fromMillisecondsSinceEpoch(0),
              text: null,
              score: 4,
            ),
          ),
          Response(requestOptions: RequestOptions()),
        );
      });

      final pagedResponseFactory = MockPagedResponseFactory();
      final repository = ReleasesRepositoryImpl(
          releasesRemoteService: service,
          loggerFactory: loggerFactory,
          pagedResponseFactory: pagedResponseFactory,
          userDtoConverter: userDtoConverter);
      final pair = await repository.getAlbumById("stub").first;
      expect(pair?.second,
          Review(id: "review_stub", text: "", publishTime: DateTime.fromMillisecondsSinceEpoch(0), rating: 4));
    });

    test("If server returns record with review with text during song request, review in pair != null", () async {
      final service = MockReleasesRemoteService();
      when(service.getAlbumById(any)).thenAnswer((realInvocation) async {
        return HttpResponse(
          AlbumByIdResponse(
            album: AlbumDto(
              id: "stub",
              name: "stub",
              author: "stub",
              date: DateTime.now(),
              songsCount: 12,
            ),
            review: ReviewDto(
              id: 'review_stub',
              publishedAt: DateTime.fromMillisecondsSinceEpoch(0),
              text: "review_stub",
              score: 4,
            ),
          ),
          Response(requestOptions: RequestOptions()),
        );
      });

      final pagedResponseFactory = MockPagedResponseFactory();
      final repository = ReleasesRepositoryImpl(
          releasesRemoteService: service,
          loggerFactory: loggerFactory,
          pagedResponseFactory: pagedResponseFactory,
          userDtoConverter: userDtoConverter);
      final pair = await repository.getAlbumById("stub").first;
      expect(
          pair?.second,
          Review(
              id: "review_stub", text: "review_stub", publishTime: DateTime.fromMillisecondsSinceEpoch(0), rating: 4));
    });
  });

  group("Review sending", () {
    test("If server returns error during album review sending, method returns false", () async {
      final service = MockReleasesRemoteService();
      when(service.sendReview(any, any)).thenAnswer((realInvocation) async => throw DioError.badResponse(
          statusCode: HttpStatus.badRequest,
          requestOptions: RequestOptions(),
          response:
              Response(data: ErrorResponse(code: 1, message: "Stub!").toJson(), requestOptions: RequestOptions())));

      final pagedResponseFactory = MockPagedResponseFactory();
      final repository = ReleasesRepositoryImpl(
          releasesRemoteService: service,
          loggerFactory: loggerFactory,
          pagedResponseFactory: pagedResponseFactory,
          userDtoConverter: userDtoConverter);
      expect(await repository.sendAlbumReview("stub", 5), false);
    });

    test("If server returns error during song review sending, method returns false", () async {
      final service = MockReleasesRemoteService();
      when(service.sendReview(any, any)).thenAnswer((realInvocation) async => throw DioError.badResponse(
          statusCode: HttpStatus.badRequest,
          requestOptions: RequestOptions(),
          response:
              Response(data: ErrorResponse(code: 1, message: "Stub!").toJson(), requestOptions: RequestOptions())));

      final pagedResponseFactory = MockPagedResponseFactory();
      final repository = ReleasesRepositoryImpl(
          releasesRemoteService: service,
          loggerFactory: loggerFactory,
          pagedResponseFactory: pagedResponseFactory,
          userDtoConverter: userDtoConverter);
      expect(await repository.sendSongReview("stub", 5), false);
    });

    test("If server not available during album review sending, method returns false", () async {
      final service = MockReleasesRemoteService();
      when(service.sendReview(any, any)).thenAnswer(
          (realInvocation) async => throw DioError.connectionError(requestOptions: RequestOptions(), reason: ""));

      final pagedResponseFactory = MockPagedResponseFactory();
      final repository = ReleasesRepositoryImpl(
          releasesRemoteService: service,
          loggerFactory: loggerFactory,
          pagedResponseFactory: pagedResponseFactory,
          userDtoConverter: userDtoConverter);
      expect(await repository.sendAlbumReview("stub", 5), false);
    });

    test("If server not available during song review sending, method returns false", () async {
      final service = MockReleasesRemoteService();
      when(service.sendReview(any, any)).thenAnswer(
          (realInvocation) async => throw DioError.connectionError(requestOptions: RequestOptions(), reason: ""));

      final pagedResponseFactory = MockPagedResponseFactory();
      final repository = ReleasesRepositoryImpl(
          releasesRemoteService: service,
          loggerFactory: loggerFactory,
          pagedResponseFactory: pagedResponseFactory,
          userDtoConverter: userDtoConverter);
      expect(await repository.sendSongReview("stub", 5), false);
    });

    test("If album review successfully sent, method returns true", () async {
      final service = MockReleasesRemoteService();
      when(service.sendReview(any, any)).thenAnswer((realInvocation) async {
        final response = SendReviewResponse(
          id: "id",
          publishedAt: DateTime.fromMillisecondsSinceEpoch(0),
          text: "text",
          score: 10,
          song: null,
          album: AlbumDto(
            id: "id",
            name: "name",
            author: "author",
            date: DateTime.fromMillisecondsSinceEpoch(0),
            songsCount: 12,
          ),
        );

        return HttpResponse(response, Response(requestOptions: RequestOptions()));
      });

      final pagedResponseFactory = MockPagedResponseFactory();
      final repository = ReleasesRepositoryImpl(
          releasesRemoteService: service,
          loggerFactory: loggerFactory,
          pagedResponseFactory: pagedResponseFactory,
          userDtoConverter: userDtoConverter);
      expect(await repository.sendAlbumReview("id", 5), true);
    });

    test("If song review successfully sent, method returns true", () async {
      final service = MockReleasesRemoteService();
      when(service.sendReview(any, any)).thenAnswer((realInvocation) async {
        final response = SendReviewResponse(
          id: "id",
          publishedAt: DateTime.fromMillisecondsSinceEpoch(0),
          text: "text",
          score: 10,
          album: null,
          song: SongDto(
            id: "id",
            name: "name",
            author: "author",
            date: DateTime.fromMillisecondsSinceEpoch(0),
            durationInNanoseconds: 1000000000,
          ),
        );

        return HttpResponse(response, Response(requestOptions: RequestOptions()));
      });

      final pagedResponseFactory = MockPagedResponseFactory();
      final repository = ReleasesRepositoryImpl(
          releasesRemoteService: service,
          loggerFactory: loggerFactory,
          pagedResponseFactory: pagedResponseFactory,
          userDtoConverter: userDtoConverter);
      expect(await repository.sendSongReview("id", 5), true);
    });

    test("If album review successfully sent, getAlbumById returns new data", () async {
      final service = MockReleasesRemoteService();
      when(service.getAlbumById(any)).thenAnswer((realInvocation) async {
        return HttpResponse(
          AlbumByIdResponse(
            album: AlbumDto(
              id: "id",
              name: "stub_name",
              author: "stub_author",
              date: DateTime.fromMillisecondsSinceEpoch(0),
              songsCount: 12,
            ),
            review: ReviewDto(
              id: '0',
              publishedAt: DateTime.now(),
              text: null,
              score: null,
            ),
          ),
          Response(requestOptions: RequestOptions()),
        );
      });
      when(service.sendReview(any, any)).thenAnswer((realInvocation) async {
        final response = SendReviewResponse(
          id: "id",
          publishedAt: DateTime.fromMillisecondsSinceEpoch(0),
          text: "text",
          score: 4,
          song: null,
          album: AlbumDto(
            id: "id",
            name: "name",
            author: "author",
            date: DateTime.fromMillisecondsSinceEpoch(0),
            songsCount: 12,
          ),
        );

        return HttpResponse(response, Response(requestOptions: RequestOptions()));
      });

      final pagedResponseFactory = MockPagedResponseFactory();
      final repository = ReleasesRepositoryImpl(
          releasesRemoteService: service,
          loggerFactory: loggerFactory,
          pagedResponseFactory: pagedResponseFactory,
          userDtoConverter: userDtoConverter);
      final stream = repository.getAlbumById("id").shareReplay()..listen((event) {});

      await stream.first;
      await repository.sendAlbumReview("id", 5);

      final events = await stream.take(2).toList();
      expect(events.length, 2);
      expect(events[1]?.second,
          Review(id: "id", text: "text", publishTime: DateTime.fromMillisecondsSinceEpoch(0), rating: 4));
    });

    test("If song review successfully sent, getSongById returns new data", () async {
      final service = MockReleasesRemoteService();
      when(service.getSongById(any)).thenAnswer((realInvocation) async {
        return HttpResponse(
          SongByIdResponse(
            song: SongDto(
              id: "id",
              name: "stub",
              author: "stub",
              date: DateTime.now(),
              durationInNanoseconds: 1000000000,
            ),
            review: ReviewDto(
              id: '0',
              publishedAt: DateTime.now(),
              text: null,
              score: null,
            ),
          ),
          Response(requestOptions: RequestOptions()),
        );
      });
      when(service.sendReview(any, any)).thenAnswer((realInvocation) async {
        final response = SendReviewResponse(
          id: "id",
          publishedAt: DateTime.fromMillisecondsSinceEpoch(0),
          text: "text",
          score: 4,
          album: null,
          song: SongDto(
            id: "id",
            name: "name",
            author: "author",
            date: DateTime.fromMillisecondsSinceEpoch(0),
            durationInNanoseconds: 1000000000,
          ),
        );

        return HttpResponse(response, Response(requestOptions: RequestOptions()));
      });

      final pagedResponseFactory = MockPagedResponseFactory();
      final repository = ReleasesRepositoryImpl(
          releasesRemoteService: service,
          loggerFactory: loggerFactory,
          pagedResponseFactory: pagedResponseFactory,
          userDtoConverter: userDtoConverter);
      final stream = repository.getSongById("id").shareReplay()..listen((event) {});

      await stream.first;
      await repository.sendSongReview("id", 5);

      final events = await stream.take(2).toList();
      expect(events.length, 2);
      expect(events[1]?.second,
          Review(id: "id", text: "text", publishTime: DateTime.fromMillisecondsSinceEpoch(0), rating: 4));
    });
  });

  group("Review deleting", () {
    test("If server not available during album review removing, method returns false", () async {
      final service = MockReleasesRemoteService();
      when(service.deleteReview(any)).thenAnswer(
          (realInvocation) async => throw DioError.connectionError(requestOptions: RequestOptions(), reason: "Stub!"));

      final pagedResponseFactory = MockPagedResponseFactory();
      final repository = ReleasesRepositoryImpl(
          releasesRemoteService: service,
          loggerFactory: loggerFactory,
          pagedResponseFactory: pagedResponseFactory,
          userDtoConverter: userDtoConverter);
      expect(await repository.removeAlbumReview("id"), false);
    });

    test("If server not available during song review removing, method returns false", () async {
      final service = MockReleasesRemoteService();
      when(service.deleteReview(any)).thenAnswer(
          (realInvocation) async => throw DioError.connectionError(requestOptions: RequestOptions(), reason: "Stub!"));

      final pagedResponseFactory = MockPagedResponseFactory();
      final repository = ReleasesRepositoryImpl(
          releasesRemoteService: service,
          loggerFactory: loggerFactory,
          pagedResponseFactory: pagedResponseFactory,
          userDtoConverter: userDtoConverter);
      expect(await repository.removeAlbumReview("id"), false);
    });

    test("If server return error during album review removing, method returns false", () async {
      final service = MockReleasesRemoteService();
      when(service.deleteReview(any)).thenAnswer((realInvocation) async => throw DioError.badResponse(
          statusCode: HttpStatus.badRequest,
          requestOptions: RequestOptions(),
          response:
              Response(data: ErrorResponse(code: 1, message: "Stub!").toJson(), requestOptions: RequestOptions())));

      final pagedResponseFactory = MockPagedResponseFactory();
      final repository = ReleasesRepositoryImpl(
          releasesRemoteService: service,
          loggerFactory: loggerFactory,
          pagedResponseFactory: pagedResponseFactory,
          userDtoConverter: userDtoConverter);
      expect(await repository.removeAlbumReview("id"), false);
    });

    test("If server return error during song review removing, method returns false", () async {
      final service = MockReleasesRemoteService();
      when(service.deleteReview(any)).thenAnswer((realInvocation) async => throw DioError.badResponse(
          statusCode: HttpStatus.badRequest,
          requestOptions: RequestOptions(),
          response:
              Response(data: ErrorResponse(code: 1, message: "Stub!").toJson(), requestOptions: RequestOptions())));

      final pagedResponseFactory = MockPagedResponseFactory();
      final repository = ReleasesRepositoryImpl(
          releasesRemoteService: service,
          loggerFactory: loggerFactory,
          pagedResponseFactory: pagedResponseFactory,
          userDtoConverter: userDtoConverter);
      expect(await repository.removeAlbumReview("id"), false);
    });

    test("If server successfully complete album review removing request, method returns true", () async {
      final service = MockReleasesRemoteService();
      when(service.deleteReview(any)).thenAnswer((realInvocation) async {
        final response = DeleteReviewResponse(
          id: "id",
          publishedAt: DateTime.fromMillisecondsSinceEpoch(0),
          text: "text",
          score: 4,
          song: null,
          album: AlbumDto(
            id: "id",
            name: "name",
            author: "author",
            date: DateTime.fromMillisecondsSinceEpoch(0),
            songsCount: 12,
          ),
        );

        return HttpResponse(response, Response(requestOptions: RequestOptions()));
      });

      final pagedResponseFactory = MockPagedResponseFactory();
      final repository = ReleasesRepositoryImpl(
          releasesRemoteService: service,
          loggerFactory: loggerFactory,
          pagedResponseFactory: pagedResponseFactory,
          userDtoConverter: userDtoConverter);
      expect(await repository.removeAlbumReview("id"), true);
    });

    test("If server successfully complete song review removing request, method returns true", () async {
      final service = MockReleasesRemoteService();
      when(service.deleteReview(any)).thenAnswer((realInvocation) async {
        final response = DeleteReviewResponse(
          id: "id",
          publishedAt: DateTime.fromMillisecondsSinceEpoch(0),
          text: "text",
          score: 4,
          album: null,
          song: SongDto(
            id: "id",
            name: "name",
            author: "author",
            date: DateTime.fromMillisecondsSinceEpoch(0),
            durationInNanoseconds: 1000000000,
          ),
        );

        return HttpResponse(response, Response(requestOptions: RequestOptions()));
      });

      final pagedResponseFactory = MockPagedResponseFactory();
      final repository = ReleasesRepositoryImpl(
          releasesRemoteService: service,
          loggerFactory: loggerFactory,
          pagedResponseFactory: pagedResponseFactory,
          userDtoConverter: userDtoConverter);
      expect(await repository.removeSongReview("id"), true);
    });

    test("If server successfully complete album review removing request, getAlbumById returns new data", () async {
      final service = MockReleasesRemoteService();
      when(service.getAlbumById(any)).thenAnswer((realInvocation) async {
        return HttpResponse(
          AlbumByIdResponse(
            album: AlbumDto(
              id: "id",
              name: "stub_name",
              author: "stub_author",
              date: DateTime.fromMillisecondsSinceEpoch(0),
              songsCount: 12,
            ),
            review: ReviewDto(
              id: "review_id",
              publishedAt: DateTime.fromMillisecondsSinceEpoch(0),
              text: "text",
              score: 4,
            ),
          ),
          Response(requestOptions: RequestOptions()),
        );
      });
      when(service.deleteReview(any)).thenAnswer((realInvocation) async {
        final response = DeleteReviewResponse(
          id: "0",
          publishedAt: DateTime.fromMillisecondsSinceEpoch(0),
          text: null,
          score: null,
          song: null,
          album: AlbumDto(
            id: "id",
            name: "name",
            author: "author",
            date: DateTime.fromMillisecondsSinceEpoch(0),
            songsCount: 12,
          ),
        );

        return HttpResponse(response, Response(requestOptions: RequestOptions()));
      });

      final pagedResponseFactory = MockPagedResponseFactory();
      final repository = ReleasesRepositoryImpl(
          releasesRemoteService: service,
          loggerFactory: loggerFactory,
          pagedResponseFactory: pagedResponseFactory,
          userDtoConverter: userDtoConverter);
      final stream = repository.getAlbumById("id").shareReplay()..listen((event) {});

      await stream.first;
      await repository.removeAlbumReview("review_id");

      final events = await stream.take(2).toList();
      expect(events.length, 2);
      expect(events[1]?.second, null);
    });

    test("If server successfully complete song review removing request, getSongById returns new data", () async {
      final service = MockReleasesRemoteService();
      when(service.getSongById(any)).thenAnswer((realInvocation) async {
        return HttpResponse(
          SongByIdResponse(
            song: SongDto(
              id: "id",
              name: "stub",
              author: "stub",
              date: DateTime.now(),
              durationInNanoseconds: 1000000000,
            ),
            review: ReviewDto(
              id: "review_id",
              publishedAt: DateTime.fromMillisecondsSinceEpoch(0),
              text: "text",
              score: 4,
            ),
          ),
          Response(requestOptions: RequestOptions()),
        );
      });
      when(service.deleteReview(any)).thenAnswer((realInvocation) async {
        final response = DeleteReviewResponse(
          id: "0",
          publishedAt: DateTime.fromMillisecondsSinceEpoch(0),
          text: null,
          score: null,
          album: null,
          song: SongDto(
            id: "id",
            name: "name",
            author: "author",
            date: DateTime.fromMillisecondsSinceEpoch(0),
            durationInNanoseconds: 1000000000,
          ),
        );

        return HttpResponse(response, Response(requestOptions: RequestOptions()));
      });

      final pagedResponseFactory = MockPagedResponseFactory();
      final repository = ReleasesRepositoryImpl(
          releasesRemoteService: service,
          loggerFactory: loggerFactory,
          pagedResponseFactory: pagedResponseFactory,
          userDtoConverter: userDtoConverter);
      final stream = repository.getSongById("id").shareReplay()..listen((event) {});

      await stream.first;
      await repository.removeSongReview("review_id");

      final events = await stream.take(2).toList();
      expect(events.length, 2);
      expect(events[1]?.second, null);
    });
  });

  group("getSubscribersReviews", () {
    test("If server not available, stream return nothing", () async {
      final service = MockReleasesRemoteService();
      final pagedResponseFactory = MockPagedResponseFactory();
      final repository = ReleasesRepositoryImpl(
          releasesRemoteService: service,
          loggerFactory: loggerFactory,
          pagedResponseFactory: pagedResponseFactory,
          userDtoConverter: userDtoConverter);

      try {
        await repository.getSubscribersReviews("stub").first.timeout(const Duration(seconds: 5));
        fail("Stream returns value");
      } catch (ex) {
        // All in normal!
      }
    });

    test("If server returns error, stream return nothing", () async {
      final service = MockReleasesRemoteService();
      final pagedResponseFactory = MockPagedResponseFactory();
      final repository = ReleasesRepositoryImpl(
          releasesRemoteService: service,
          loggerFactory: loggerFactory,
          pagedResponseFactory: pagedResponseFactory,
          userDtoConverter: userDtoConverter);

      when(service.getReviews(any)).thenAnswer((realInvocation) async => throw DioError.badResponse(
          statusCode: HttpStatus.badRequest,
          requestOptions: RequestOptions(),
          response:
              Response(data: ErrorResponse(code: 1, message: "Stub!").toJson(), requestOptions: RequestOptions())));

      try {
        await repository.getSubscribersReviews("stub").first.timeout(const Duration(seconds: 5));
        fail("Stream returns value");
      } catch (ex) {
        // All in normal!
      }
    });

    test("If server returns data, stream return it", () async {
      final service = MockReleasesRemoteService();
      final pagedResponseFactory = MockPagedResponseFactory();
      final repository = ReleasesRepositoryImpl(
          releasesRemoteService: service,
          loggerFactory: loggerFactory,
          pagedResponseFactory: pagedResponseFactory,
          userDtoConverter: userDtoConverter);

      when(service.getReviews(any)).thenAnswer((realInvocation) async {
        return HttpResponse(
            GetReviewsResponse(meanScore: 4.0, reviews: [
              UserReviewDto(
                id: 'first',
                publishedAt: DateTime.fromMillisecondsSinceEpoch(0),
                score: 5,
                text: 'First',
                user: UserDto(
                  id: "first_user",
                  username: "username",
                  nickname: "nickname",
                  hasPicture: false,
                  subscriberAmount: 0,
                  subscriptionsAmount: 0,
                ),
              ),
              UserReviewDto(
                id: 'second',
                publishedAt: DateTime.fromMillisecondsSinceEpoch(1),
                score: 3,
                text: 'Second',
                user: UserDto(
                  id: "second_user",
                  username: "username",
                  nickname: "nickname",
                  hasPicture: false,
                  subscriberAmount: 0,
                  subscriptionsAmount: 0,
                ),
              ),
            ]),
            Response(requestOptions: RequestOptions()));
      });

      final events = await repository.getSubscribersReviews("releaseId").toList();
      expect(events, [
        Pair(first: [
          UserReview(
            review: Review(
              id: "first",
              text: 'First',
              publishTime: DateTime.fromMillisecondsSinceEpoch(0),
              rating: 5,
            ),
            user: const User(
              id: "first_user",
              username: "username",
              nickname: "nickname",
              subscriberAmount: 0,
              subscriptionsAmount: 0,
              avatarUrl: null,
            ),
          ),
          UserReview(
            review: Review(
              id: "second",
              text: 'Second',
              publishTime: DateTime.fromMillisecondsSinceEpoch(1),
              rating: 3,
            ),
            user: const User(
              id: "second_user",
              username: "username",
              nickname: "nickname",
              subscriberAmount: 0,
              subscriptionsAmount: 0,
              avatarUrl: null,
            ),
          ),
        ], second: 4.0)
      ]);
    });
  });
}
