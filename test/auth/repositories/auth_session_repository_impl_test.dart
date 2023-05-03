import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:musicday_mobile/auth/models/session.dart';
import 'package:musicday_mobile/auth/repositories/auth_session_repository_impl.dart';
import 'package:musicday_mobile/core/logging/logger.dart';
import 'package:musicday_mobile/core/logging/logger_factory.dart';

import 'auth_session_repository_impl_test.mocks.dart';

@GenerateMocks([FlutterSecureStorage, LoggerFactory, Logger])
void main() {
  final loggerFactory = MockLoggerFactory();
  when(loggerFactory.create(any)).thenReturn(MockLogger());

  test("If session not exists, returns null", () async {
    final storage = createStorageMock();
    final repository = AuthSessionRepositoryImpl(loggerFactory: loggerFactory, flutterSecureStorage: storage);
    expect(await repository.currentSession.first, null);
  });

  test("If session exists, returns instance", () async {
    final storage = createStorageMock();
    final firstRepository = AuthSessionRepositoryImpl(loggerFactory: loggerFactory, flutterSecureStorage: storage);
    await firstRepository.saveSession(const Session(token: "123", isAuthorizationToken: true));

    final secondRepository = AuthSessionRepositoryImpl(loggerFactory: loggerFactory, flutterSecureStorage: storage);
    expect(await secondRepository.currentSession.first, const Session(token: "123", isAuthorizationToken: true));
  });

  test("If session not exists, but saved in future, returns session", () async {
    final storage = createStorageMock();
    final repository = AuthSessionRepositoryImpl(loggerFactory: loggerFactory, flutterSecureStorage: storage);
    await repository.saveSession(const Session(token: "123", isAuthorizationToken: true));
    expect(await repository.currentSession.first, const Session(token: "123", isAuthorizationToken: true));
  });

  test("If session exists & doing rewriting, returns new instance", () async {
    final storage = createStorageMock();
    final repository = AuthSessionRepositoryImpl(loggerFactory: loggerFactory, flutterSecureStorage: storage);
    await repository.saveSession(const Session(token: "123", isAuthorizationToken: true));
    await repository.saveSession(const Session(token: "456", isAuthorizationToken: false));
    expect(await repository.currentSession.first, const Session(token: "456", isAuthorizationToken: false));
  });

  test("If session removing & not saved, nothing emits", () async {
    final storage = createStorageMock();
    final repository = AuthSessionRepositoryImpl(loggerFactory: loggerFactory, flutterSecureStorage: storage);
    await repository.deleteSession();
    expect(await repository.currentSession.first, null);
  });

  test("If sessions removing & saved, returns null", () async {
    final storage = createStorageMock();
    final repository = AuthSessionRepositoryImpl(loggerFactory: loggerFactory, flutterSecureStorage: storage);
    await repository.saveSession(const Session(token: "123", isAuthorizationToken: true));
    await repository.deleteSession();

    expect(await repository.currentSession.first, null);
  });
}

/// Создает мок защищенного хранилища.
FlutterSecureStorage createStorageMock() {
  final map = <String, String>{};
  final mock = MockFlutterSecureStorage();

  when(mock.read(key: anyNamed("key"))).thenAnswer((realInvocation) async => map[realInvocation.namedArguments[#key]]);
  when(mock.write(key: anyNamed("key"), value: anyNamed("value"))).thenAnswer((realInvocation) async {
    final key = realInvocation.namedArguments[#key] as String;
    final value = realInvocation.namedArguments[#value] as String;
    map[key] = value;
  });

  return mock;
}
