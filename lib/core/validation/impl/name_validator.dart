import 'package:musicday_mobile/core/logging/logger.dart';
import 'package:musicday_mobile/core/logging/logger_factory.dart';
import 'package:musicday_mobile/core/validation/validator.dart';

class NameValidator implements Validator<String> {
  final Logger _logger;
  final Set<int> _allowedSymbols =
      "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM_-.0123456789".codeUnits.toSet();

  NameValidator({
    required LoggerFactory loggerFactory,
    required bool allowSpaces,
  }) : _logger = loggerFactory.create("NameValidator") {
    if (allowSpaces) {
      _allowedSymbols.add(" ".codeUnits[0]);
    }
  }

  @override
  bool validate(String data) {
    _logger.debug("validate($data)");

    if (data.length < 5 || data.length > 30) {
      _logger.warn("validate(): length mismatch, current = ${data.length}");
      return false;
    }

    for (final codeUnit in data.codeUnits) {
      if (!_allowedSymbols.contains(codeUnit)) {
        _logger.warn("validate(): contains unallowed symbol = ${String.fromCharCode(codeUnit)}");
        return false;
      }
    }

    return true;
  }
}
