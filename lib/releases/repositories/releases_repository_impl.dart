import 'dart:async';
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:musicday_mobile/core/logging/logger.dart';
import 'package:musicday_mobile/core/logging/logger_factory.dart';
import 'package:musicday_mobile/core/network/extensions/future_http_response_extensions.dart';
import 'package:musicday_mobile/core/network/helpers/network_retry_helper.dart';
import 'package:musicday_mobile/core/network/network_consts.dart';
import 'package:musicday_mobile/core/paging/factory/paged_response_factory.dart';
import 'package:musicday_mobile/core/paging/paged_response.dart';
import 'package:musicday_mobile/profiles/dtos/user_dto.dart';
import 'package:musicday_mobile/profiles/models/user.dart';
import 'package:musicday_mobile/releases/dtos/album_dto.dart';
import 'package:musicday_mobile/releases/dtos/review_dto.dart';
import 'package:musicday_mobile/releases/dtos/send_review_request.dart';
import 'package:musicday_mobile/releases/dtos/song_dto.dart';
import 'package:musicday_mobile/releases/dtos/user_review_dto.dart';
import 'package:musicday_mobile/releases/models/album.dart';
import 'package:musicday_mobile/releases/models/song.dart';
import 'package:musicday_mobile/releases/models/review.dart';
import 'package:musicday_mobile/core/common/pair.dart';
import 'package:musicday_mobile/releases/models/user_review.dart';
import 'package:musicday_mobile/releases/network/releases_remote_service.dart';
import 'package:musicday_mobile/releases/repositories/releases_repository.dart';
import 'package:rxdart/rxdart.dart';

@Singleton(as: ReleasesRepository)
class ReleasesRepositoryImpl implements ReleasesRepository {
  final _newSongsStreamController = StreamController<Pair<Song, Review?>>.broadcast();
  final _newAlbumsStreamController = StreamController<Pair<Album, Review?>>.broadcast();
  final ReleasesRemoteService releasesRemoteService;
  final PagedResponseFactory pagedResponseFactory;
  final Converter<UserDto, User> userDtoConverter;
  final Logger _logger;

  ReleasesRepositoryImpl({
    required this.releasesRemoteService,
    required this.pagedResponseFactory,
    required this.userDtoConverter,
    required LoggerFactory loggerFactory,
  }) : _logger = loggerFactory.create("ReleasesRepositoryImpl");

  @override
  Stream<Pair<Song, Review?>?> getSongById(String id) {
    _logger.debug("getSongById($id)");

    return NetworkRetryHelper.retry(() => releasesRemoteService.getSongById(id), _logger).map((response) {
      return response.when(
        serverNotAvailable: () {
          _logger.warn("getSongById($id): serverNotAvailable");
          return null;
        },
        serverError: (code) {
          _logger.warn("getSongById($id): error_code = $code");
          return Pair(first: null, second: code);
        },
        ok: (response) {
          _logger.debug("getSongById($id): ok");
          return Pair(first: _convertSongResponseDto(response.song, response.review), second: null);
        },
      );
    }).switchMap((data) {
      if (data?.first != null) {
        return _newSongsStreamController.stream
            .startWith(data!.first!)
            .where((event) => event.first.id == id)
            .map((event) => Pair(first: event, second: null));
      }

      return Stream.value(data);
    }).takeWhileInclusive((pair) {
      return pair?.second == null;
    }).map((event) => event?.first);
  }

  @override
  Stream<Pair<Album, Review?>?> getAlbumById(String id) {
    _logger.debug("getAlbumById($id)");

    return NetworkRetryHelper.retry(() => releasesRemoteService.getAlbumById(id), _logger).map((response) {
      return response.when(
        serverNotAvailable: () {
          _logger.warn("getSongById($id): serverNotAvailable");
          return null;
        },
        serverError: (code) {
          _logger.warn("getSongById($id): error_code = $code");
          return Pair(first: null, second: code);
        },
        ok: (response) {
          _logger.debug("getSongById($id): ok");
          return Pair(first: _convertAlbumResponseDto(response.album, response.review), second: null);
        },
      );
    }).switchMap((data) {
      if (data?.first != null) {
        return _newAlbumsStreamController.stream
            .startWith(data!.first!)
            .where((event) => event.first.id == id)
            .map((event) => Pair(first: event, second: null));
      }

      return Stream.value(data);
    }).takeWhileInclusive((pair) {
      return pair?.second == null;
    }).map((event) => event?.first);
  }

  @override
  Stream<Pair<List<UserReview>, double>> getSubscribersReviews(String releaseId) {
    return NetworkRetryHelper.retry(() => releasesRemoteService.getReviews(releaseId), _logger)
        .map((event) => event.mapOrNull(ok: (value) => value)?.data)
        .whereNotNull()
        .map((event) {
      return Pair(
        first: event.reviews.map(_convertUserReviewDto).toList(growable: true),
        second: event.meanScore,
      );
    }).takeWhileInclusive((element) => true);
  }

  @override
  Future<bool> sendAlbumReview(String id, int score, {String? comment}) async {
    _logger.debug("sendAlbumReview($id): score = $score; comment = $comment");

    final body = SendReviewRequest(score: score, text: comment);
    return (await releasesRemoteService.sendReview(id, body).safe(_logger)).map(
      serverNotAvailable: (_) {
        _logger.debug("sendAlbumReview($id): received serverNotAvailable");
        return false;
      },
      serverError: (state) {
        _logger.warn("sendAlbumReview($id): received serverError(${state.code})");
        return false;
      },
      ok: (state) {
        _logger.debug("sendAlbumReview($id): received ok");

        if (state.data.song != null && !_isSongNull(state.data.song!)) {
          _logger.debug("sendAlbumReview($id): state.data.song != null");
          _newSongsStreamController.add(_convertSongResponseDto(state.data.song!, state.data));
        } else {
          _logger.debug("sendAlbumReview($id): state.data.song == null");
          _newAlbumsStreamController.add(_convertAlbumResponseDto(state.data.album!, state.data));
        }

        return true;
      },
    );
  }

  @override
  Future<bool> sendSongReview(String id, int score, {String? comment}) async {
    _logger.debug("sendSongReview($id): score = $score; comment = $comment");

    final body = SendReviewRequest(score: score, text: comment);
    return (await releasesRemoteService.sendReview(id, body).safe(_logger)).map(
      serverNotAvailable: (_) {
        _logger.debug("sendSongReview($id): received serverNotAvailable");
        return false;
      },
      serverError: (state) {
        _logger.warn("sendSongReview($id): received serverError(${state.code})");
        return false;
      },
      ok: (state) {
        _logger.debug("sendSongReview($id): received ok");

        if (state.data.song != null && !_isSongNull(state.data.song!)) {
          _logger.debug("sendSongReview($id): state.data.song != null");
          _newSongsStreamController.add(_convertSongResponseDto(state.data.song!, state.data));
        } else {
          _logger.debug("sendSongReview($id): state.data.song == null");
          _newAlbumsStreamController.add(_convertAlbumResponseDto(state.data.album!, state.data));
        }

        return true;
      },
    );
  }

  @override
  Future<bool> removeAlbumReview(String reviewId) async {
    _logger.debug("removeAlbumReview($reviewId)");

    return (await releasesRemoteService.deleteReview(reviewId).safe(_logger)).when(
      serverNotAvailable: () {
        _logger.warn("removeAlbumReview($reviewId): received serverNotAvailable");
        return false;
      },
      serverError: (code) {
        _logger.warn("removeAlbumReview($reviewId): received serverError($code)");
        return false;
      },
      ok: (response) {
        _logger.debug("removeAlbumReview($reviewId): received ok");
        _newAlbumsStreamController.add(_convertAlbumResponseDto(response.album!, response));
        return true;
      },
    );
  }

  @override
  Future<bool> removeSongReview(String reviewId) async {
    _logger.debug("removeSongReview($reviewId)");

    return (await releasesRemoteService.deleteReview(reviewId).safe(_logger)).when(
      serverNotAvailable: () {
        _logger.warn("removeSongReview($reviewId): received serverNotAvailable");
        return false;
      },
      serverError: (code) {
        _logger.warn("removeSongReview($reviewId): received serverError($code)");
        return false;
      },
      ok: (response) {
        _logger.debug("removeSongReview($reviewId): received ok");
        _newSongsStreamController.add(_convertSongResponseDto(response.song!, response));
        return true;
      },
    );
  }

  @override
  PagedResponse<Album> searchAlbums(String query) {
    _logger.debug("searchAlbums($query)");
    return pagedResponseFactory.create((size, offset) {
      return NetworkRetryHelper.retry(() => releasesRemoteService.searchAlbums(query, offset, size), _logger)
          .map((event) => event.maybeMap(ok: (ok) => ok.data, orElse: () => null))
          .whereNotNull()
          .map((event) => event.map((e) => e.album))
          .map((event) => event.map(_convertAlbumDto))
          .map((event) => event.toList(growable: false));
    }, 20);
  }

  @override
  PagedResponse<Song> searchSongs(String query) {
    _logger.debug("searchSongs($query)");
    return pagedResponseFactory.create((size, offset) {
      return NetworkRetryHelper.retry(() => releasesRemoteService.searchSongs(query, offset, size), _logger)
          .map((event) => event.maybeMap(ok: (ok) => ok.data, orElse: () => null))
          .whereNotNull()
          .map((event) => event.map((e) => e.song))
          .map((event) => event.map(_convertSongDto))
          .map((event) => event.toList(growable: false));
    }, 20);
  }

  @override
  @disposeMethod
  Future<void> dispose() async {
    _logger.debug("dispose()");
    await _newAlbumsStreamController.close();
    await _newSongsStreamController.close();
  }

  Pair<Song, Review?> _convertSongResponseDto(SongDto songDto, ReviewDto reviewDto) {
    return Pair(
      second: _convertReviewDto(reviewDto),
      first: _convertSongDto(songDto),
    );
  }

  Song _convertSongDto(SongDto songDto) {
    return Song(
      id: songDto.id,
      name: songDto.name,
      author: songDto.author,
      durationInSeconds: songDto.durationInNanoseconds ~/ 1000 ~/ 1000 ~/ 1000,
      year: songDto.date.year,
      avatarUrl: "${NetworkConsts.baseUrl}/image/release/${songDto.id}",
    );
  }

  Pair<Album, Review?> _convertAlbumResponseDto(AlbumDto albumDto, ReviewDto reviewDto) {
    return Pair(
      second: _convertReviewDto(reviewDto),
      first: _convertAlbumDto(albumDto),
    );
  }

  Album _convertAlbumDto(AlbumDto albumDto) {
    return Album(
      id: albumDto.id,
      name: albumDto.name,
      author: albumDto.author,
      songsCount: albumDto.songsCount,
      year: albumDto.date.year,
      avatarUrl: "${NetworkConsts.baseUrl}/image/release/${albumDto.id}",
    );
  }

  Review? _convertReviewDto(ReviewDto dto) {
    final text = dto.text;
    final score = dto.score;
    return score != null ? Review(id: dto.id, publishTime: dto.publishedAt, rating: score, text: text ?? "") : null;
  }

  UserReview _convertUserReviewDto(UserReviewDto dto) {
    return UserReview(
      review: Review(id: dto.id, text: dto.text ?? "", publishTime: dto.publishedAt, rating: dto.score!),
      user: userDtoConverter.convert(dto.user),
    );
  }

  bool _isSongNull(SongDto dto) => dto.id == "00000000-0000-0000-0000-000000000000";
}
