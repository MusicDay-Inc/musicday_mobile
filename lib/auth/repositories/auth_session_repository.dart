import 'package:musicday_mobile/auth/models/session.dart';

abstract class AuthSessionRepository {
  /// Поток с текущей сессией.
  late Stream<Session?> currentSession;

  /// Сохраняет сессию авторизации/регистрации.
  Future<void> saveSession(Session session);

  /// Выдает ID текущего пользователя.
  Future<String?> getCurrentUserId();

  /// Удаляет сессию авторизации/регистрации.
  Future<void> deleteSession();

  /// Освобождает занятые ресурсы.
  Future<void> dispose();
}
