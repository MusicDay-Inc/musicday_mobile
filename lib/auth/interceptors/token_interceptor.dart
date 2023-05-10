import 'dart:io';

import 'package:dio/dio.dart';
import 'package:musicday_mobile/auth/repositories/auth_session_repository.dart';
import 'package:musicday_mobile/core/logging/logger.dart';
import 'package:musicday_mobile/core/logging/logger_factory.dart';

class TokenInterceptor extends Interceptor {
  final Logger _logger;
  final AuthSessionRepository authSessionRepository;

  TokenInterceptor({
    required this.authSessionRepository,
    required LoggerFactory loggerFactory,
  }) : _logger = loggerFactory.create("TokenInterceptor");

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.debug("onRequest(${options.path})");

    authSessionRepository.currentSession.first.then((session) {
      if (session != null) {
        _logger.debug("onRequest(${options.path}): session != null");
        options.headers[HttpHeaders.authorizationHeader] = session.token;
      } else {
        _logger.debug("onRequest(${options.path}): session == null");
      }

      super.onRequest(options, handler);
    });
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    _logger.warn("onError(${err.requestOptions.path})");

    if (err.response?.statusCode == HttpStatus.unauthorized) {
      _logger.debug("onError(${err.requestOptions.path}): unauthorized");
      authSessionRepository.deleteSession().then((value) => super.onError(err, handler));
    } else {
      _logger.debug("onError(${err.requestOptions.path}): authorized");
      super.onError(err, handler);
    }
  }
}
