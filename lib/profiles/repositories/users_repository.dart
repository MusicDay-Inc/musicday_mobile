import 'package:musicday_mobile/core/common/pair.dart';
import 'package:musicday_mobile/core/paging/paged_response.dart';
import 'package:musicday_mobile/profiles/models/user.dart';
import 'package:musicday_mobile/releases/models/activity.dart';

abstract class UsersRepository {
  /// Возвращает поток с информацией о пользователе.
  Stream<Pair<User, bool>?> getUserById(String id);

  /// Подписывает на пользователя.
  Future<bool> subscribeToUser(String id);

  /// Отписывает от пользователя.
  Future<bool> unsubscribeToUser(String id);

  /// Возвращает постраничный ответ с активностями пользователя.
  PagedResponse<Activity> getActivities(String id);

  /// Освобождает занятые ресурсы.
  Future<void> dispose();
}
