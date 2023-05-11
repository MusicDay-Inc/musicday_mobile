import 'package:musicday_mobile/core/logging/logger_factory.dart';
import 'package:musicday_mobile/core/paging/factory/paged_response_factory.dart';
import 'package:musicday_mobile/core/paging/paged_response.dart';
import 'package:musicday_mobile/core/paging/paged_response_impl.dart';

class PagedResponseFactoryImpl implements PagedResponseFactory {
  final LoggerFactory loggerFactory;

  PagedResponseFactoryImpl({
    required this.loggerFactory,
  });

  @override
  PagedResponse<T> create<T>(Stream<List<T>> Function(int size, int offset) getPartItemsStream, int pageSize) {
    return PagedResponseImpl(
      pageSize: pageSize,
      loggerFactory: loggerFactory,
      getPartItemsStream: getPartItemsStream,
    );
  }
}
