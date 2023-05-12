import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:musicday_mobile/core/common/pair.dart';
import 'package:musicday_mobile/core/logging/logger.dart';
import 'package:musicday_mobile/core/logging/logger_factory.dart';
import 'package:musicday_mobile/core/network/extensions/future_http_response_extensions.dart';
import 'package:musicday_mobile/core/network/helpers/network_retry_helper.dart';
import 'package:musicday_mobile/profiles/di/profiles_scope.dart';
import 'package:musicday_mobile/profiles/dtos/user_dto.dart';
import 'package:musicday_mobile/profiles/models/user.dart';
import 'package:musicday_mobile/profiles/network/users_remote_service.dart';
import 'package:musicday_mobile/profiles/repositories/users_repository.dart';
import 'package:rxdart/rxdart.dart';

@Singleton(as: UsersRepository, scope: ProfilesScope.name)
class UsersRepositoryImpl extends UsersRepository {
  final Logger _logger;
  final UsersRemoteService usersRemoteService;
  final Converter<UserDto, User> userDtoConverter;

  UsersRepositoryImpl({
    required LoggerFactory loggerFactory,
    required this.usersRemoteService,
    required this.userDtoConverter,
  }) : _logger = loggerFactory.create("UsersRepositoryImpl") {}

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
          return Pair(
            first: Pair(first: userDtoConverter.convert(data.user), second: data.isClientSubscribed),
            second: null,
          );
        },
      );
    }).takeWhileInclusive((pair) {
      return pair?.second == null;
    }).map((event) => event?.first);
  }

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
        return true;
      },
    );
  }

  @override
  Future<void> dispose() {
    // TODO: implement dispose
    throw UnimplementedError();
  }
}
