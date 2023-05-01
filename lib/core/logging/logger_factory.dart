import 'package:musicday_mobile/core/logging/logger.dart';

abstract class LoggerFactory {
  // Создает инстанс логгера с указанным тегом.
  Logger create(String tag);
}
