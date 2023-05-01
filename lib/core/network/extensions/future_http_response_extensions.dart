import 'package:musicday_mobile/core/logging/logger.dart';
import 'package:retrofit/retrofit.dart';

extension FutureHttpResponseExtensions<T> on Future<HttpResponse<T>> {
  Future<HttpResponse<T>?> safe(Logger logger) async {
    try {
      return await this;
    } catch (exception, stacktrace) {
      logger.error("safe(), socket exception!", stacktrace: stacktrace, exception: exception);
      return null;
    }
  }
}
