import 'package:dio/dio.dart';
import 'package:musicday_mobile/core/logging/logger.dart';
import 'package:musicday_mobile/core/network/dtos/error_response.dart';
import 'package:musicday_mobile/core/network/models/network_response.dart';
import 'package:retrofit/retrofit.dart';

extension FutureHttpResponseExtensions<T> on Future<HttpResponse<T>> {
  Future<NetworkResponse<T>> safe(Logger logger) async {
    try {
      return NetworkResponse<T>.ok((await this).data);
    } catch (exception, stacktrace) {
      if (exception is DioError) {
        final response = exception.response;

        if (response != null && response.data is Map<String, dynamic>) {
          final errorResponse = ErrorResponse.fromJson(response.data);
          logger.warn("safe(), error_code = ${errorResponse.code}, error_msg = ${errorResponse.message}!");
          return NetworkResponse<T>.serverError(errorResponse.code);
        }
      }

      logger.error("safe(), unhandled error!", stacktrace: stacktrace, exception: exception);
      return NetworkResponse<T>.serverNotAvailable();
    }
  }
}
