import 'dart:io';

import 'package:musicday_mobile/core/common/pair.dart';
import 'package:musicday_mobile/core/paging/paged_response.dart';
import 'package:musicday_mobile/profiles/models/user.dart';
import 'package:musicday_mobile/profiles/models/user_info.dart';
import 'package:musicday_mobile/releases/models/activity.dart';

abstract class UsersRepository {
  /// Возвращает поток с информацией о пользователе.
  Stream<Pair<User, UserInfo>?> getUserById(String id);

  /// Подписывает на пользователя.
  Future<bool> subscribeToUser(String id);

  /// Отписывает от пользователя.
  Future<bool> unsubscribeToUser(String id);

  /// Устанавливает аватарку пользователя.
  Future<bool> uploadAvatar(String id, File file);

  /// Возвращает постраничный ответ с активностями подписок.
  PagedResponse<UserActivity> getFeed();

  /// Возвращает постраничный ответ с активностями пользователя.
  PagedResponse<Activity> getActivities(String id);

  /// Возвращает постраничный ответ с активностями пользователя, только песни.
  PagedResponse<Activity> getOnlySongActivities(String id);

  /// Возвращает постраничный ответ с активностями пользователя, только альбомы.
  PagedResponse<Activity> getOnlyAlbumActivities(String id);

  /// Возвращает постраничный ответ с подписчиками пользователя.
  PagedResponse<User> getSubscribers(String id);

  /// Возвращает постраничный ответ с подписками пользователя.
  PagedResponse<User> getSubscriptions(String id);

  /// Возвращает постраничный ответ с пользователями, удовлетворяющих запросу.
  PagedResponse<User> searchUsers(String query);

  /// Освобождает занятые ресурсы.
  Future<void> dispose();
}
