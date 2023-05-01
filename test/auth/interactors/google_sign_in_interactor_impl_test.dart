import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:musicday_mobile/auth/interactors/google_sign_in_interactor_impl.dart';
import 'package:musicday_mobile/auth/models/sign_in_result.dart';
import 'package:musicday_mobile/auth/network/auth_remote_service.dart';
import 'package:musicday_mobile/auth/repositories/auth_session_repository.dart';
import 'package:musicday_mobile/core/logging/logger.dart';
import 'package:musicday_mobile/core/logging/logger_factory.dart';

import 'google_sign_in_interactor_impl_test.mocks.dart';

@GenerateMocks([
  Logger,
  LoggerFactory,
  GoogleSignIn,
  GoogleSignInAccount,
  GoogleSignInAuthentication,
  AuthSessionRepository,
  AuthRemoteService,
])
void main() {
  final googleSignIn = MockGoogleSignIn();
  final loggerFactory = MockLoggerFactory();
  final authSessionRepository = MockAuthSessionRepository();
  final authRemoteService = MockAuthRemoteService();
  when(loggerFactory.create(any)).thenReturn(MockLogger());

  group("start()", () {
    test("When form force closed, returns cancelled", () async {
      when(googleSignIn.signIn()).thenAnswer((_) => Future.value(null));

      final interactor = GoogleSignInInteractorImpl(
        loggerFactory: loggerFactory,
        authSessionRepository: authSessionRepository,
        authRemoteService: authRemoteService,
        googleSignIn: googleSignIn,
      );

      expect(await interactor.start(), const SignInResult.cancelled());
    });

    test("When server not respond, returns serverError", () async {
      final account = MockGoogleSignInAccount();
      final authentication = MockGoogleSignInAuthentication();
      when(authentication.idToken).thenReturn("idToken");
      when(account.authentication).thenAnswer((_) => Future.value(authentication));
      when(googleSignIn.signIn()).thenAnswer((_) => Future.value(account));
      when(authRemoteService.startGoogleSignIn(any)).thenAnswer((_) async => throw const SocketException("Stub!"));

      final interactor = GoogleSignInInteractorImpl(
        loggerFactory: loggerFactory,
        authSessionRepository: authSessionRepository,
        authRemoteService: authRemoteService,
        googleSignIn: googleSignIn,
      );

      expect(await interactor.start(), const SignInResult.serverError());
    });

    test("When server throw error, returns serverError", () async {
      final account = MockGoogleSignInAccount();
      final authentication = MockGoogleSignInAuthentication();
      final response = HttpResponse(null, Response(requestOptions: RequestOptions(), statusCode: HttpStatus.ok));
      when(authentication.idToken).thenReturn("idToken");
      when(account.authentication).thenAnswer((_) => Future.value(authentication));
      when(googleSignIn.signIn()).thenAnswer((_) => Future.value(account));
      // when(authRemoteService.startGoogleSignIn(any)).thenAnswer((_) async => response);

      final interactor = GoogleSignInInteractorImpl(
        loggerFactory: loggerFactory,
        authSessionRepository: authSessionRepository,
        authRemoteService: authRemoteService,
        googleSignIn: googleSignIn,
      );

      expect(await interactor.start(), const SignInResult.serverError());
    });
  });
}
