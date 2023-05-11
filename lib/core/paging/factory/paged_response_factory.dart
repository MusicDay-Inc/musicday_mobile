import 'package:musicday_mobile/core/paging/paged_response.dart';

abstract class PagedResponseFactory {
  /// Создает инстанс пагинатора с указанным размером страниц.
  PagedResponse<T> create<T>(Stream<List<T>> Function(int size, int offset) getPartItemsStream, int pageSize);
}
