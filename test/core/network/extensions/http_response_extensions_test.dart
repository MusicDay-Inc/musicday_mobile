import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:musicday_mobile/core/network/extensions/http_response_extensions.dart';
import 'package:retrofit/retrofit.dart';

void main() {
  test("isSuccess = true & isError = false, if statusCode = ok", () {
    final response = HttpResponse("{}", Response(requestOptions: RequestOptions(), statusCode: HttpStatus.ok));
    expect(response.isSuccess, true);
    expect(response.isError, false);
  });

  test("isSuccess = false & isError = true, if statusCode != ok", () {
    final response = HttpResponse("{}", Response(requestOptions: RequestOptions(), statusCode: HttpStatus.badRequest));
    expect(response.isSuccess, false);
    expect(response.isError, true);
  });
}
