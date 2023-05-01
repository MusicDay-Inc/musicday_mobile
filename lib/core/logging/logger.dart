abstract class Logger {
  /// Записывает дебажное сообщение в лог.
  void debug(String message);

  /// Записывает предупреждающее сообщение в лог.
  void warn(String message, {dynamic exception, StackTrace? stacktrace});

  /// Записывает сообщение об ошибке в лог.
  void error(String message, {dynamic exception, StackTrace? stacktrace});
}
