import 'package:flutter_test/flutter_test.dart';
import 'package:musicday_mobile/core/formatting/date_formatting_extensions.dart';

void main() {
  test("Check that seconds timestamp formatting", () {
    expect(1683401933.formatDate(), "06.05.2023");
  });
}
