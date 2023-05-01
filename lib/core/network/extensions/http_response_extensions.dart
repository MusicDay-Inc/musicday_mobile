import 'dart:io';

import 'package:retrofit/retrofit.dart';

extension HttpResponseExtensions<T> on HttpResponse<T> {
  bool get isSuccess => response.statusCode == HttpStatus.ok;
  bool get isError => response.statusCode != HttpStatus.ok;
}
