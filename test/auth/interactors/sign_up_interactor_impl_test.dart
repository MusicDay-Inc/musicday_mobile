import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:musicday_mobile/auth/dtos/sign_up_response.dart';
import 'package:musicday_mobile/auth/interactors/sign_up_interactor_impl.dart';
import 'package:musicday_mobile/auth/models/session.dart';
import 'package:musicday_mobile/auth/models/sign_up_result.dart';
import 'package:musicday_mobile/auth/network/auth_remote_service.dart';
import 'package:musicday_mobile/auth/repositories/auth_session_repository.dart';
import 'package:musicday_mobile/core/logging/logger.dart';
import 'package:musicday_mobile/core/logging/logger_factory.dart';
import 'package:musicday_mobile/core/network/dtos/error_response.dart';
import 'package:musicday_mobile/core/network/network_consts.dart';
import 'package:musicday_mobile/core/validation/validator.dart';
import 'package:retrofit/dio.dart';

import 'sign_up_interactor_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<Logger>(),
  MockSpec<Validator>(),
  MockSpec<LoggerFactory>(),
  MockSpec<AuthRemoteService>(),
  MockSpec<AuthSessionRepository>(),
])
void main() {
  final loggerFactory = MockLoggerFactory();
  when(loggerFactory.create(any)).thenReturn(MockLogger());

  test("When nickname & username are invalid, returns invalidFormat", () async {
    final nicknameValidator = MockValidator<String>();
    final usernameValidator = MockValidator<String>();
    final authSessionRepository = MockAuthSessionRepository();
    final interactor = SignUpInteractorImpl(
      loggerFactory: loggerFactory,
      nicknameValidator: nicknameValidator,
      usernameValidator: usernameValidator,
      authSessionRepository: authSessionRepository,
      authRemoteService: MockAuthRemoteService(),
    );

    when(nicknameValidator.validate(any)).thenReturn(false);
    when(usernameValidator.validate(any)).thenReturn(false);
    final result = await interactor.signUp("nickname", "username");
    expect(result, const SignUpResult.invalidFormat(true, true));
  });

  test("When nickname is valid & username is invalid, returns invalidFormat", () async {
    final nicknameValidator = MockValidator<String>();
    final usernameValidator = MockValidator<String>();
    final authSessionRepository = MockAuthSessionRepository();
    final interactor = SignUpInteractorImpl(
      loggerFactory: loggerFactory,
      nicknameValidator: nicknameValidator,
      usernameValidator: usernameValidator,
      authSessionRepository: authSessionRepository,
      authRemoteService: MockAuthRemoteService(),
    );

    when(nicknameValidator.validate(any)).thenReturn(true);
    when(usernameValidator.validate(any)).thenReturn(false);
    final result = await interactor.signUp("nickname", "username");
    expect(result, const SignUpResult.invalidFormat(false, true));
  });

  test("When nickname is invalid & username is valid, returns invalidFormat", () async {
    final nicknameValidator = MockValidator<String>();
    final usernameValidator = MockValidator<String>();
    final authSessionRepository = MockAuthSessionRepository();
    final interactor = SignUpInteractorImpl(
      loggerFactory: loggerFactory,
      nicknameValidator: nicknameValidator,
      usernameValidator: usernameValidator,
      authSessionRepository: authSessionRepository,
      authRemoteService: MockAuthRemoteService(),
    );

    when(nicknameValidator.validate(any)).thenReturn(false);
    when(usernameValidator.validate(any)).thenReturn(true);
    final result = await interactor.signUp("nickname", "username");
    expect(result, const SignUpResult.invalidFormat(true, false));
  });

  test("When session not found, returns serverError", () async {
    final nicknameValidator = MockValidator<String>();
    final usernameValidator = MockValidator<String>();
    final authSessionRepository = MockAuthSessionRepository();
    final interactor = SignUpInteractorImpl(
      loggerFactory: loggerFactory,
      nicknameValidator: nicknameValidator,
      usernameValidator: usernameValidator,
      authSessionRepository: authSessionRepository,
      authRemoteService: MockAuthRemoteService(),
    );

    when(nicknameValidator.validate(any)).thenReturn(true);
    when(usernameValidator.validate(any)).thenReturn(true);
    when(authSessionRepository.currentSession).thenAnswer((_) => Stream.value(null));
    expect(await interactor.signUp("nickname", "username"), const SignUpResult.serverError());
  });

  test("When server unavailable, returns serverError", () async {
    final authRemoteService = MockAuthRemoteService();
    final nicknameValidator = MockValidator<String>();
    final usernameValidator = MockValidator<String>();
    final authSessionRepository = MockAuthSessionRepository();
    final interactor = SignUpInteractorImpl(
      loggerFactory: loggerFactory,
      nicknameValidator: nicknameValidator,
      usernameValidator: usernameValidator,
      authSessionRepository: authSessionRepository,
      authRemoteService: authRemoteService,
    );

    when(nicknameValidator.validate(any)).thenReturn(true);
    when(usernameValidator.validate(any)).thenReturn(true);
    when(authSessionRepository.currentSession)
        .thenAnswer((_) => Stream.value(const Session(token: "token", isAuthorizationToken: true)));
    when(authRemoteService.signUp(any)).thenAnswer((_) async => throw const SocketException("Stub!"));
    expect(await interactor.signUp("nickname", "username"), const SignUpResult.serverError());
  });

  test("When server throws unhandled error, returns serverError", () async {
    final data = ErrorResponse(code: -1, message: "").toJson();
    final authRemoteService = MockAuthRemoteService();
    final nicknameValidator = MockValidator<String>();
    final usernameValidator = MockValidator<String>();
    final authSessionRepository = MockAuthSessionRepository();
    final response = Response(requestOptions: RequestOptions(), statusCode: HttpStatus.badRequest, data: data);
    final interactor = SignUpInteractorImpl(
      loggerFactory: loggerFactory,
      nicknameValidator: nicknameValidator,
      usernameValidator: usernameValidator,
      authSessionRepository: authSessionRepository,
      authRemoteService: authRemoteService,
    );

    when(nicknameValidator.validate(any)).thenReturn(true);
    when(usernameValidator.validate(any)).thenReturn(true);
    when(authSessionRepository.currentSession)
        .thenAnswer((_) => Stream.value(const Session(token: "token", isAuthorizationToken: true)));
    when(authRemoteService.signUp(any))
        .thenAnswer((_) async => throw DioError(requestOptions: RequestOptions(), response: response));
    expect(await interactor.signUp("nickname", "username"), const SignUpResult.serverError());
  });

  test("When server returns errorIncorrectBody, returns invalidFormat", () async {
    final data = ErrorResponse(code: NetworkConsts.errorIncorrectBody, message: "").toJson();
    final authRemoteService = MockAuthRemoteService();
    final nicknameValidator = MockValidator<String>();
    final usernameValidator = MockValidator<String>();
    final authSessionRepository = MockAuthSessionRepository();
    final response = Response(requestOptions: RequestOptions(), statusCode: HttpStatus.badRequest, data: data);
    final interactor = SignUpInteractorImpl(
      loggerFactory: loggerFactory,
      nicknameValidator: nicknameValidator,
      usernameValidator: usernameValidator,
      authSessionRepository: authSessionRepository,
      authRemoteService: authRemoteService,
    );

    when(nicknameValidator.validate(any)).thenReturn(true);
    when(usernameValidator.validate(any)).thenReturn(true);
    when(authSessionRepository.currentSession)
        .thenAnswer((_) => Stream.value(const Session(token: "token", isAuthorizationToken: true)));
    when(authRemoteService.signUp(any))
        .thenAnswer((_) async => throw DioError(requestOptions: RequestOptions(), response: response));
    expect(await interactor.signUp("nickname", "username"), const SignUpResult.invalidFormat(true, true));
  });

  test("When server successfully done response, returns ok & saving session", () async {
    final data = SignUpResponse(jwtToken: "newToken");
    final authRemoteService = MockAuthRemoteService();
    final nicknameValidator = MockValidator<String>();
    final usernameValidator = MockValidator<String>();
    final authSessionRepository = MockAuthSessionRepository();
    final response = Response<SignUpResponse>(requestOptions: RequestOptions(), statusCode: HttpStatus.ok, data: data);
    final httpResponse = HttpResponse(data, response);
    final interactor = SignUpInteractorImpl(
      loggerFactory: loggerFactory,
      nicknameValidator: nicknameValidator,
      usernameValidator: usernameValidator,
      authSessionRepository: authSessionRepository,
      authRemoteService: authRemoteService,
    );

    when(nicknameValidator.validate(any)).thenReturn(true);
    when(usernameValidator.validate(any)).thenReturn(true);
    when(authSessionRepository.currentSession)
        .thenAnswer((_) => Stream.value(const Session(token: "token", isAuthorizationToken: true)));
    when(authRemoteService.signUp(any)).thenAnswer((_) async => httpResponse);
    expect(await interactor.signUp("nickname", "username"), const SignUpResult.success());
    verify(authSessionRepository.saveSession(const Session(token: "newToken", isAuthorizationToken: false)));
  });
}
