import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:musicday_mobile/auth/di/auth_scope.dart';
import 'package:musicday_mobile/auth/repositories/auth_session_repository.dart';
import 'package:musicday_mobile/core/logging/logger.dart';
import 'package:musicday_mobile/core/logging/logger_factory.dart';

@Injectable(scope: AuthScope.name, as: AuthSessionRepository)
class AuthSessionRepositoryImpl implements AuthSessionRepository {
  static const String _isAuthorizationToken = "is_authorization_token";
  static const String _tokenKey = "token";

  final FlutterSecureStorage flutterSecureStorage;
  final Logger _logger;

  AuthSessionRepositoryImpl({
    required LoggerFactory loggerFactory,
    required this.flutterSecureStorage,
  }) : _logger = loggerFactory.create("AuthSessionRepositoryImpl");

  @override
  Future<void> saveSession(String token, bool isAuthorizationToken) async {
    _logger.debug("saveSession(): isAuthorizationToken = $isAuthorizationToken");
    await flutterSecureStorage.write(key: _isAuthorizationToken, value: "$isAuthorizationToken");
    await flutterSecureStorage.write(key: _tokenKey, value: token);
  }
}
