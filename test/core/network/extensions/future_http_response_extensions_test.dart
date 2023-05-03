import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:musicday_mobile/core/logging/logger.dart';
import 'package:musicday_mobile/core/network/dtos/error_response.dart';
import 'package:musicday_mobile/core/network/extensions/future_http_response_extensions.dart';
import 'package:musicday_mobile/core/network/models/network_response.dart';
import 'package:retrofit/retrofit.dart';

import 'future_http_response_extensions_test.mocks.dart';

@GenerateMocks([Logger])
void main() {
  test("If server returns success, returns ok with data", () async {
    final response = HttpResponse("{}", Response(requestOptions: RequestOptions(), statusCode: HttpStatus.ok));
    final future = Future.value(response);
    expect(await future.safe(MockLogger()), const NetworkResponse.ok("{}"));
  });

  test("If server returns error, returns serverError", () async {
    final data = ErrorResponse(code: 1, message: "Hello Error!").toJson();
    final response = Response(requestOptions: RequestOptions(), statusCode: HttpStatus.badRequest, data: data);
    final future = Future<HttpResponse<String>>.error(DioError(requestOptions: RequestOptions(), response: response));
    expect(await future.safe(MockLogger()), const NetworkResponse<String>.serverError(1));
  });

  test("If server returns error in invalid json format, returns serverNotAvailable", () async {
    final response = Response(requestOptions: RequestOptions(), statusCode: HttpStatus.badRequest, data: {});
    final future = Future<HttpResponse<String>>.error(DioError(requestOptions: RequestOptions(), response: response));
    expect(await future.safe(MockLogger()), const NetworkResponse<String>.serverNotAvailable());
  });

  test("If exception thrown, returns serverNotAvailable", () async {
    final future = Future<HttpResponse<String>>.error(1);
    expect(await future.safe(MockLogger()), const NetworkResponse<String>.serverNotAvailable());
  });
}
