import 'package:musicday_mobile/core/paging/paged_response_state.dart';

abstract class PagedResponse<T> {
  /// Возвращает поток с состоянием пегинации.
  Stream<PagedResponseState<T>> get state;

  /// Загружает следующую страницу.
  Future<void> loadMore();

  /// Освобождает занятые ресурсы.
  Future<void> dispose();
}
