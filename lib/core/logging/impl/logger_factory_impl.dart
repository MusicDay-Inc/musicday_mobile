import 'package:injectable/injectable.dart';
import 'package:musicday_mobile/core/logging/impl/console_logger.dart';
import 'package:musicday_mobile/core/logging/logger.dart';
import 'package:musicday_mobile/core/logging/logger_factory.dart';

@Singleton(as: LoggerFactory)
class LoggerFactoryImpl implements LoggerFactory {
  @override
  Logger create(String tag) => ConsoleLogger(tag: tag);
}
