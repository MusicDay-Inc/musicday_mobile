import 'package:flutter_test/flutter_test.dart';
import 'package:musicday_mobile/core/extensions/strings_extensions.dart';

void main() {
  test("If string == true, toBoolean() returns true", () {
    expect("true".toBoolean(), true);
  });

  test("If string == false, toBoolean() returns false", () {
    expect("false".toBoolean(), false);
  });

  test("If string == TRUE, toBoolean() returns true", () {
    expect("TRUE".toBoolean(), true);
  });

  test("If string == FALSE, toBoolean() returns false", () {
    expect("FALSE".toBoolean(), false);
  });

  test("If string != true && string != false, toBoolean() returns null", () {
    expect("qwerty".toBoolean(), null);
  });
}
