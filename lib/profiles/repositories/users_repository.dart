import 'package:musicday_mobile/profiles/models/user.dart';

abstract class UsersRepository {
  /// Возвращает поток с информацией о пользователе.
  Stream<User> getUserById(String id);

  /// Подписывает на пользователя.
  Future<bool> subscribeToUser(String id);

  /// Отписывает от пользователя.
  Future<bool> unsubscribeToUser(String id);
}
