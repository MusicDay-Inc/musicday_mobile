import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:musicday_mobile/core/logging/logger.dart';
import 'package:musicday_mobile/core/network/extensions/future_http_response_extensions.dart';
import 'package:retrofit/retrofit.dart';

import 'future_http_response_extensions_test.mocks.dart';

@GenerateMocks([Logger])
void main() {
  test("If exception not thrown, returns result", () async {
    final response = HttpResponse("{}", Response(requestOptions: RequestOptions(), statusCode: HttpStatus.ok));
    final future = Future.value(response);
    expect(await future.safe(MockLogger()), isNot(null));
  });

  test("If exception thrown, returns null", () async {
    final future = Future<HttpResponse>.error(1);
    expect(await future.safe(MockLogger()), null);
  });
}
