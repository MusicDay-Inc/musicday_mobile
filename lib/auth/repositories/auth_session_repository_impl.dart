import 'dart:async';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:musicday_mobile/auth/di/auth_scope.dart';
import 'package:musicday_mobile/auth/models/session.dart';
import 'package:musicday_mobile/auth/repositories/auth_session_repository.dart';
import 'package:musicday_mobile/core/logging/logger.dart';
import 'package:musicday_mobile/core/logging/logger_factory.dart';
import 'package:musicday_mobile/core/extensions/strings_extensions.dart';
import 'package:rxdart/rxdart.dart';

@Singleton(scope: AuthScope.name, as: AuthSessionRepository)
class AuthSessionRepositoryImpl implements AuthSessionRepository {
  static const String _isAuthorizationToken = "is_authorization_token";
  static const String _tokenKey = "token";

  final StreamController<Session?> _sessionStreamController = ReplaySubject(maxSize: 1);
  final FlutterSecureStorage flutterSecureStorage;
  final Logger _logger;

  @override
  late Stream<Session?> currentSession = Rx.defer(() => _sessionStreamController.stream.distinct());

  AuthSessionRepositoryImpl({
    required LoggerFactory loggerFactory,
    required this.flutterSecureStorage,
  }) : _logger = loggerFactory.create("AuthSessionRepositoryImpl") {
    _logger.debug("init");
    _loadInitialSession();
  }

  @override
  Future<void> saveSession(Session session) async {
    _logger.debug("saveSession(): session = $session");
    await flutterSecureStorage.write(key: _isAuthorizationToken, value: "${session.isAuthorizationToken}");
    await flutterSecureStorage.write(key: _tokenKey, value: session.token);
    _sessionStreamController.sink.add(session);
  }

  @override
  Future<void> deleteSession() async {
    _logger.debug("deleteSession()");

    final session = await currentSession.first;
    if (session == null) {
      _logger.debug("deleteSession(), session == null");
      return;
    }

    _logger.debug("deleteSession(), session != null");
    await flutterSecureStorage.delete(key: _isAuthorizationToken);
    await flutterSecureStorage.delete(key: _tokenKey);
    _sessionStreamController.sink.add(null);
  }

  Future<void> _loadInitialSession() async {
    _logger.debug("_loadInitialSession()");
    final isAuthorizationToken = (await flutterSecureStorage.read(key: _isAuthorizationToken))?.toBoolean();
    final token = await flutterSecureStorage.read(key: _tokenKey);

    if (token == null || isAuthorizationToken == null) {
      _logger.debug("_loadInitialSession(), session == null (token == null || isAuthorizationToken == null)");
      _sessionStreamController.sink.add(null);
      return;
    }

    _logger.debug("_loadInitialSession(), isAuthorizationToken = $isAuthorizationToken, token != null");
    _sessionStreamController.sink.add(Session(token: token, isAuthorizationToken: isAuthorizationToken));
  }

  @override
  Future<String?> getCurrentUserId() async {
    _logger.debug("getCurrentUserId()");
    return currentSession.map((event) => event?.token).map((token) {
      if (token == null) {
        _logger.debug("getCurrentUser(): token == null");
        return null;
      }

      _logger.debug("getCurrentUser(): token != null");
      return JWT.decode(token).payload["user_id"] as String;
    }).first;
  }

  @override
  @disposeMethod
  Future<void> dispose() async {
    _logger.debug("dispose()");
    await _sessionStreamController.close();
  }
}
