import 'package:musicday_mobile/auth/models/session.dart';

abstract class AuthSessionRepository {
  /// Поток с текущей сессией.
  late Stream<Session?> currentSession;

  /// Сохраняет сессию авторизации/регистрации.
  Future<void> saveSession(Session session);

  /// Удаляет сессию авторизации/регистрации.
  Future<void> deleteSession();
}
