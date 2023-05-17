import 'package:injectable/injectable.dart';
import 'package:musicday_mobile/core/logging/logger_factory.dart';
import 'package:musicday_mobile/core/validation/di/validators_names.dart';
import 'package:musicday_mobile/core/validation/impl/name_validator.dart';
import 'package:musicday_mobile/core/validation/validator.dart';

@module
abstract class ValidatorsModule {
  @Singleton()
  @Named(ValidatorsNames.username)
  Validator<String> provideUsernameValidator(LoggerFactory loggerFactory) {
    return NameValidator(loggerFactory: loggerFactory, allowSpaces: false);
  }

  @Singleton()
  @Named(ValidatorsNames.nickname)
  Validator<String> provideNicknameValidator(LoggerFactory loggerFactory) {
    return NameValidator(loggerFactory: loggerFactory, allowSpaces: true);
  }
}
