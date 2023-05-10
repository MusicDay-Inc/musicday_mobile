import 'dart:collection';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:musicday_mobile/core/logging/logger.dart';
import 'package:musicday_mobile/core/network/dtos/error_response.dart';
import 'package:musicday_mobile/core/network/helpers/network_retry_helper.dart';
import 'package:musicday_mobile/core/network/models/network_response.dart';
import 'package:retrofit/retrofit.dart';

import 'network_retry_helper_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Logger>()])
void main() {
  test("Request retrying until success server completing", () async {
    final responses = Queue.of([
      () => throw const SocketException.closed(),
      () => throw const SocketException.closed(),
      () => HttpResponse<int>(1, Response(requestOptions: RequestOptions()))
    ]);
    final events = await NetworkRetryHelper.retry(
      () async => responses.removeFirst()(),
      MockLogger(),
      interval: Duration.zero,
    ).toList();

    expect(events, [const NetworkResponse.ok(1)]);
  });

  test("Request retrying until error server completing", () async {
    final responses = Queue.of([
      () => throw const SocketException.closed(),
      () => throw const SocketException.closed(),
      () {
        return throw DioError.badResponse(
          statusCode: HttpStatus.unauthorized,
          response: Response(requestOptions: RequestOptions(), data: ErrorResponse(code: 1, message: "Stub!").toJson()),
          requestOptions: RequestOptions(),
        );
      }
    ]);
    final events = await NetworkRetryHelper.retry(
      () async => responses.removeFirst()(),
      MockLogger(),
      interval: Duration.zero,
    ).toList();

    expect(events, [const NetworkResponse.serverError(1)]);
  });
}
