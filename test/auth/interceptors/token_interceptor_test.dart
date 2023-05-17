import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_web_server/mock_web_server.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:musicday_mobile/auth/interactors/google_sign_out_interactor.dart';
import 'package:musicday_mobile/auth/interceptors/token_interceptor.dart';
import 'package:musicday_mobile/auth/models/session.dart';
import 'package:musicday_mobile/auth/repositories/auth_session_repository.dart';
import 'package:musicday_mobile/core/logging/logger.dart';
import 'package:musicday_mobile/core/logging/logger_factory.dart';
import 'package:rxdart/rxdart.dart';
import 'token_interceptor_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthSessionRepository>(),
  MockSpec<LoggerFactory>(),
  MockSpec<Logger>(),
  MockSpec<GoogleSignOutInteractor>()
])
void main() {
  final loggerFactory = MockLoggerFactory();
  when(loggerFactory.create(any)).thenReturn(MockLogger());

  test("Token contains in request headers", () async {
    final googleSignOutInteractor = MockGoogleSignOutInteractor();
    final mockWebServer = MockWebServer(port: 8000);
    final authSessionRepository = MockAuthSessionRepository();
    final dio = Dio()
      ..interceptors.add(TokenInterceptor(
        googleSignOutInteractor: googleSignOutInteractor,
        authSessionRepository: authSessionRepository,
        loggerFactory: loggerFactory,
      ));

    mockWebServer.start();
    mockWebServer.enqueue(httpCode: HttpStatus.unauthorized);
    when(authSessionRepository.currentSession)
        .thenAnswer((_) => ReplaySubject()..add(const Session(token: "test", isAuthorizationToken: false)));

    try {
      await dio.request("http://localhost:8000/check");
    } catch (ex) {
      // Ignore
    }

    final request = mockWebServer.takeRequest();
    expect(request.headers[HttpHeaders.authorizationHeader], "test");
    mockWebServer.shutdown();
  });

  test("If server returns token error, token deletes", () async {
    final mockWebServer = MockWebServer(port: 8000);
    final authSessionRepository = MockAuthSessionRepository();
    final googleSignOutInteractor = MockGoogleSignOutInteractor();
    final dio = Dio()
      ..interceptors.add(TokenInterceptor(
        googleSignOutInteractor: googleSignOutInteractor,
        authSessionRepository: authSessionRepository,
        loggerFactory: loggerFactory,
      ));

    mockWebServer.start();
    mockWebServer.enqueue(httpCode: HttpStatus.unauthorized);
    when(authSessionRepository.currentSession)
        .thenAnswer((_) => ReplaySubject()..add(const Session(token: "test", isAuthorizationToken: false)));

    try {
      await dio.get("http://localhost:8000/check");
    } catch (ex) {
      // Ignore
    }

    verify(authSessionRepository.deleteSession());
    mockWebServer.shutdown();
  });

  test("If server returns success response, token not deletes", () async {
    final mockWebServer = MockWebServer(port: 8000);
    final authSessionRepository = MockAuthSessionRepository();
    final googleSignOutInteractor = MockGoogleSignOutInteractor();
    final dio = Dio()
      ..interceptors.add(TokenInterceptor(
        googleSignOutInteractor: googleSignOutInteractor,
        authSessionRepository: authSessionRepository,
        loggerFactory: loggerFactory,
      ));

    mockWebServer.start();
    mockWebServer.enqueue(httpCode: HttpStatus.ok);
    when(authSessionRepository.currentSession)
        .thenAnswer((_) => ReplaySubject()..add(const Session(token: "test", isAuthorizationToken: false)));

    try {
      await dio.get("http://localhost:8000/check");
    } catch (ex) {
      // Ignore
    }

    verifyNever(authSessionRepository.deleteSession());
    mockWebServer.shutdown();
  });
}
