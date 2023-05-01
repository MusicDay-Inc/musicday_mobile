abstract class AuthSessionRepository {
  /// Сохраняет токен сессии авторизации/регистрации.
  Future<void> saveSession(String token, bool isAuthorizationToken);
}
