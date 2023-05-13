import 'dart:async';
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:musicday_mobile/core/common/pair.dart';
import 'package:musicday_mobile/core/logging/logger.dart';
import 'package:musicday_mobile/core/logging/logger_factory.dart';
import 'package:musicday_mobile/core/network/extensions/future_http_response_extensions.dart';
import 'package:musicday_mobile/core/network/helpers/network_retry_helper.dart';
import 'package:musicday_mobile/core/paging/factory/paged_response_factory.dart';
import 'package:musicday_mobile/core/paging/paged_response.dart';
import 'package:musicday_mobile/profiles/dtos/activity_dto.dart';
import 'package:musicday_mobile/profiles/dtos/get_profile_response.dart';
import 'package:musicday_mobile/profiles/dtos/user_dto.dart';
import 'package:musicday_mobile/profiles/models/user.dart';
import 'package:musicday_mobile/profiles/network/users_remote_service.dart';
import 'package:musicday_mobile/profiles/repositories/users_repository.dart';
import 'package:musicday_mobile/releases/dtos/review_dto.dart';
import 'package:musicday_mobile/releases/dtos/song_dto.dart';
import 'package:musicday_mobile/releases/models/activity.dart';
import 'package:musicday_mobile/releases/models/album.dart';
import 'package:musicday_mobile/releases/models/release.dart';
import 'package:musicday_mobile/releases/models/review.dart';
import 'package:musicday_mobile/releases/models/song.dart';
import 'package:rxdart/rxdart.dart';

@Singleton(as: UsersRepository)
class UsersRepositoryImpl extends UsersRepository {
  final Logger _logger;
  final UsersRemoteService usersRemoteService;
  final Converter<UserDto, User> userDtoConverter;
  final PagedResponseFactory pagedResponseFactory;
  final _newUsersController = StreamController<Pair<User, bool>>.broadcast();

  UsersRepositoryImpl({
    required LoggerFactory loggerFactory,
    required this.pagedResponseFactory,
    required this.usersRemoteService,
    required this.userDtoConverter,
  }) : _logger = loggerFactory.create("UsersRepositoryImpl");

  @override
  Stream<Pair<User, bool>?> getUserById(String id) {
    _logger.debug("getUserById($id)");
    return NetworkRetryHelper.retry(() => usersRemoteService.getProfile(id), _logger).map((response) {
      return response.when(
        serverNotAvailable: () {
          _logger.debug("getUserById($id): serverNotAvailable");
          return null;
        },
        serverError: (code) {
          _logger.debug("getUserById($id): serverError($code)");
          return Pair(first: null, second: code);
        },
        ok: (data) {
          _logger.debug("getUserById($id): ok");
          return Pair(first: _convertGetProfileResponse(data), second: null);
        },
      );
    }).switchMap((data) {
      if (data?.first != null) {
        return _newUsersController.stream
            .startWith(data!.first!)
            .where((event) => event.first.id == id)
            .map((event) => Pair(first: event, second: null));
      }

      return Stream.value(data);
    }).takeWhileInclusive((pair) {
      return pair?.second == null;
    }).map((event) => event?.first);
  }

  Pair<User, bool> _convertGetProfileResponse(GetProfileResponse data) =>
      Pair(first: userDtoConverter.convert(data.user), second: data.isClientSubscribed);

  @override
  Future<bool> subscribeToUser(String id) async {
    _logger.debug("subscribeToUser($id)");
    return (await usersRemoteService.subscribe(id).safe(_logger)).when(
      serverError: (code) {
        _logger.debug("subscribeToUser($id): serverError($code)");
        return false;
      },
      serverNotAvailable: () {
        _logger.debug("subscribeToUser($id): serverNotAvailable");
        return false;
      },
      ok: (data) {
        _logger.debug("subscribeToUser($id): ok");
        _newUsersController.add(_convertGetProfileResponse(data));
        return true;
      },
    );
  }

  @override
  Future<bool> unsubscribeToUser(String id) async {
    _logger.debug("unsubscribeToUser($id)");
    return (await usersRemoteService.unsubscribe(id).safe(_logger)).when(
      serverError: (code) {
        _logger.debug("unsubscribeToUser($id): serverError($code)");
        return false;
      },
      serverNotAvailable: () {
        _logger.debug("unsubscribeToUser($id): serverNotAvailable");
        return false;
      },
      ok: (data) {
        _logger.debug("unsubscribeToUser($id): ok");
        _newUsersController.add(_convertGetProfileResponse(data));
        return true;
      },
    );
  }

  @override
  PagedResponse<Activity> getActivities(String id) {
    _logger.debug("getActivities($id)");
    return pagedResponseFactory.create((size, offset) {
      return NetworkRetryHelper.retry(() => usersRemoteService.getLibraryAll(id, offset, size), _logger)
          .map((event) => event.maybeMap(ok: (ok) => ok.data, orElse: () => null))
          .whereNotNull()
          .map((event) => event.map(_convertActivityDto))
          .map((event) => event.toList(growable: false));
    }, 20);
  }

  @override
  PagedResponse<User> getSubscribers(String id) {
    _logger.debug("getSubscribers($id)");
    return pagedResponseFactory.create((size, offset) {
      return NetworkRetryHelper.retry(() => usersRemoteService.getSubscribers(id, offset, size), _logger)
          .map((event) => event.maybeMap(ok: (ok) => ok.data, orElse: () => null))
          .whereNotNull()
          .map((event) => event.map(userDtoConverter.convert))
          .map((event) => event.toList(growable: false));
    }, 20);
  }

  @override
  PagedResponse<User> getSubscriptions(String id) {
    _logger.debug("getSubscriptions($id)");
    return pagedResponseFactory.create((size, offset) {
      return NetworkRetryHelper.retry(() => usersRemoteService.getSubscriptions(id, offset, size), _logger)
          .map((event) => event.maybeMap(ok: (ok) => ok.data, orElse: () => null))
          .whereNotNull()
          .map((event) => event.map(userDtoConverter.convert))
          .map((event) => event.toList(growable: false));
    }, 20);
  }

  @override
  PagedResponse<Activity> getOnlyAlbumActivities(String id) {
    _logger.debug("getOnlyAlbumActivities($id)");
    return pagedResponseFactory.create((size, offset) {
      return NetworkRetryHelper.retry(() => usersRemoteService.getLibraryAlbum(id, offset, size), _logger)
          .map((event) => event.maybeMap(ok: (ok) => ok.data, orElse: () => null))
          .whereNotNull()
          .map((event) => event.map(_convertActivityDto))
          .map((event) => event.toList(growable: false));
    }, 20);
  }

  @override
  PagedResponse<Activity> getOnlySongActivities(String id) {
    _logger.debug("getOnlySongActivities($id)");
    return pagedResponseFactory.create((size, offset) {
      return NetworkRetryHelper.retry(() => usersRemoteService.getLibrarySong(id, offset, size), _logger)
          .map((event) => event.maybeMap(ok: (ok) => ok.data, orElse: () => null))
          .whereNotNull()
          .map((event) => event.map(_convertActivityDto))
          .map((event) => event.toList(growable: false));
    }, 20);
  }

  @override
  PagedResponse<UserActivity> getFeed() {
    _logger.debug("getFeed()");
    return pagedResponseFactory.create((size, offset) {
      return NetworkRetryHelper.retry(() => usersRemoteService.getFeed(offset, size), _logger)
          .map((event) => event.maybeMap(ok: (ok) => ok.data, orElse: () => null))
          .whereNotNull()
          .map((event) =>
              event.map((e) => UserActivity(activity: _convertActivityDto(e), user: userDtoConverter.convert(e.user!))))
          .map((event) => event.toList(growable: false));
    }, 20);
  }

  Activity _convertActivityDto(ActivityDto dto) {
    Release release;
    if (dto.song != null && !_isSongNull(dto.song!)) {
      release = Song(
        id: dto.song!.id,
        name: dto.song!.name,
        author: dto.song!.author,
        durationInSeconds: dto.song!.durationInNanoseconds ~/ 1000 ~/ 1000 ~/ 1000,
        year: dto.song!.date.year,
        avatarUrl: null,
      );
    } else {
      release = Album(
        id: dto.album!.id,
        name: dto.album!.name,
        author: dto.album!.author,
        songsCount: dto.album!.songsCount,
        year: dto.album!.date.year,
        avatarUrl: null,
      );
    }

    return Activity(release: release, review: _convertReviewDto(dto)!);
  }

  Review? _convertReviewDto(ReviewDto dto) {
    final text = dto.text;
    final score = dto.score;
    return score != null ? Review(id: dto.id, publishTime: dto.publishedAt, rating: score, text: text ?? "") : null;
  }

  bool _isSongNull(SongDto dto) => dto.id == "00000000-0000-0000-0000-000000000000";

  @override
  @disposeMethod
  Future<void> dispose() async {
    _logger.debug("dispose()");
    await _newUsersController.close();
  }
}
