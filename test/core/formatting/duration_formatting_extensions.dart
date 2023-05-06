import 'package:flutter_test/flutter_test.dart';
import 'package:musicday_mobile/core/formatting/duration_formatting_extensions.dart';

void main() {
  test("If seconds < 60, returns <sec>s", () {
    expect("1s", 1.formatSecondsToDuration());
    expect("59s", 59.formatSecondsToDuration());
  });

  test("If seconds > 60 < 3600, returns <min>m<sec>s", () {
    expect("1m0s", 60.formatSecondsToDuration());
    expect("59m59s", 3599.formatSecondsToDuration());
  });

  test("If seconds > 3600, returns <hour>h<min>m<sec>s", () {
    expect("1h0m0s", 3600.formatSecondsToDuration());
    expect("1h0m1s", 3601.formatSecondsToDuration());
    expect("1h1m0s", 3660.formatSecondsToDuration());
  });
}
