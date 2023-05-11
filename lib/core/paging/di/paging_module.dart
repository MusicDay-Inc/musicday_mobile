import 'package:injectable/injectable.dart';
import 'package:musicday_mobile/core/logging/logger_factory.dart';
import 'package:musicday_mobile/core/paging/factory/paged_response_factory.dart';
import 'package:musicday_mobile/core/paging/factory/paged_response_factory_impl.dart';

@module
abstract class PagingModule {
  @Singleton()
  PagedResponseFactory providePagedResponseFactory(LoggerFactory loggerFactory) {
    return PagedResponseFactoryImpl(loggerFactory: loggerFactory);
  }
}
