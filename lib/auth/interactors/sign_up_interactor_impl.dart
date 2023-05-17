import 'package:injectable/injectable.dart';
import 'package:musicday_mobile/auth/dtos/sign_up_request.dart';
import 'package:musicday_mobile/auth/interactors/sign_up_interactor.dart';
import 'package:musicday_mobile/auth/models/session.dart';
import 'package:musicday_mobile/auth/models/sign_up_result.dart';
import 'package:musicday_mobile/auth/network/auth_remote_service.dart';
import 'package:musicday_mobile/auth/repositories/auth_session_repository.dart';
import 'package:musicday_mobile/core/logging/logger.dart';
import 'package:musicday_mobile/core/logging/logger_factory.dart';
import 'package:musicday_mobile/core/network/extensions/future_http_response_extensions.dart';
import 'package:musicday_mobile/core/network/network_consts.dart';
import 'package:musicday_mobile/core/validation/di/validators_names.dart';
import 'package:musicday_mobile/core/validation/validator.dart';

@Singleton(as: SignUpInteractor)
class SignUpInteractorImpl implements SignUpInteractor {
  final Logger _logger;
  final AuthRemoteService authRemoteService;
  final Validator<String> nicknameValidator;
  final Validator<String> usernameValidator;
  final AuthSessionRepository authSessionRepository;

  SignUpInteractorImpl({
    @Named(ValidatorsNames.nickname) required this.nicknameValidator,
    @Named(ValidatorsNames.username) required this.usernameValidator,
    required LoggerFactory loggerFactory,
    required this.authSessionRepository,
    required this.authRemoteService,
  }) : _logger = loggerFactory.create("SignUpInteractorImpl");

  @override
  Future<SignUpResult> signUp(String nickname, String username) async {
    _logger.debug("signUp($nickname, $username)");
    final isNicknameInvalid = !nicknameValidator.validate(nickname);
    final isUsernameInvalid = !usernameValidator.validate(username);
    if (isNicknameInvalid || isUsernameInvalid) {
      _logger.debug("signUp(): isNicknameInvalid = $isNicknameInvalid, isUsernameInvalid = $isUsernameInvalid");
      return SignUpResult.invalidFormat(isNicknameInvalid, isUsernameInvalid);
    }

    final session = await authSessionRepository.currentSession.first;
    if (session == null) {
      _logger.debug("signUp(): session == null");
      return const SignUpResult.serverError();
    }

    final request = SignUpRequest(jwtToken: session.token, nickname: nickname, username: username);
    final response = await authRemoteService.signUp(request).safe(_logger);

    return response.when(
      serverNotAvailable: () {
        _logger.debug("signUp(), serverNotAvailable");
        return const SignUpResult.serverError();
      },
      serverError: (code) async {
        _logger.debug("signUp(), serverError($code)");

        if (code == NetworkConsts.errorIncorrectBody) {
          _logger.debug("signUp(), errorIncorrectBody");
          return const SignUpResult.invalidFormat(true, true);
        }

        return const SignUpResult.serverError();
      },
      ok: (response) async {
        _logger.debug("signUp(), ok");
        await authSessionRepository.saveSession(Session(token: response.jwtToken, isAuthorizationToken: false));
        return const SignUpResult.success();
      },
    );
  }
}
