import 'package:musicday_mobile/core/logging/logger.dart';

class ConsoleLogger implements Logger {
  final String tag;

  ConsoleLogger({
    required this.tag,
  });

  @override
  void debug(String message) {
    // ignore: avoid_print
    print("$tag/D: $message");
  }

  @override
  void error(String message, {dynamic exception, StackTrace? stacktrace}) {
    // ignore: avoid_print
    print("$tag/E: $message");
    // ignore: avoid_print
    print("$tag/E: $exception");
    // ignore: avoid_print
    print("$tag/E: $stacktrace");
  }

  @override
  void warn(String message, {dynamic exception, StackTrace? stacktrace}) {
    // ignore: avoid_print
    print("$tag/W: $message");
    // ignore: avoid_print
    print("$tag/W: $exception");
    // ignore: avoid_print
    print("$tag/W: $stacktrace");
  }
}
