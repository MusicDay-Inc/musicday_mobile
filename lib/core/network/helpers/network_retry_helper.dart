import 'package:musicday_mobile/core/logging/logger.dart';
import 'package:musicday_mobile/core/network/extensions/future_http_response_extensions.dart';
import 'package:musicday_mobile/core/network/models/network_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rxdart/rxdart.dart';

class NetworkRetryHelper {
  static Stream<NetworkResponse<T>> retry<T>(Future<HttpResponse<T>> Function() provide, Logger logger,
      {Duration interval = const Duration(seconds: 5)}) {
    logger.debug("retry(): interval = ${interval.inMilliseconds}ms");

    /// Проверяет, завершилась ли повторная попытка выполнения запроса успехом.
    bool isRetryingSuccess(NetworkResponse<T> element) =>
        element.maybeMap(serverNotAvailable: (value) => true, orElse: () => false);

    return Stream.periodic(interval)
        .startWith(null)
        .doOnData((event) => logger.debug("retry(): retrying request ..."))
        .asyncMap((event) => provide().safe(logger))
        .doOnData((event) => logger.debug("retry(): retrying done, success = ${isRetryingSuccess(event)}"))
        .takeWhileInclusive(isRetryingSuccess)
        .where((event) => !isRetryingSuccess(event));
  }
}
