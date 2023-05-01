import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:musicday_mobile/auth/di/auth_scope.dart';
import 'package:musicday_mobile/auth/dtos/google_sign_in_start_request.dart';
import 'package:musicday_mobile/auth/interactors/google_sign_in_interactor.dart';
import 'package:musicday_mobile/auth/models/sign_in_result.dart';
import 'package:musicday_mobile/auth/network/auth_remote_service.dart';
import 'package:musicday_mobile/auth/repositories/auth_session_repository.dart';
import 'package:musicday_mobile/core/logging/logger.dart';
import 'package:musicday_mobile/core/logging/logger_factory.dart';
import 'package:musicday_mobile/core/network/extensions/future_http_response_extensions.dart';
import 'package:musicday_mobile/core/network/extensions/http_response_extensions.dart';

@Injectable(as: GoogleSignInInteractor, scope: AuthScope.name)
class GoogleSignInInteractorImpl implements GoogleSignInInteractor {
  final AuthSessionRepository authSessionRepository;
  final AuthRemoteService authRemoteService;
  final GoogleSignIn googleSignIn;
  final Logger _logger;

  GoogleSignInInteractorImpl({
    required LoggerFactory loggerFactory,
    required this.authSessionRepository,
    required this.authRemoteService,
    required this.googleSignIn,
  }) : _logger = loggerFactory.create("GoogleSignInInteractorImpl");

  @override
  Future<SignInResult> start() async {
    _logger.debug("start()");

    final idToken = await _openFormAndGetIdToken();
    if (idToken == null) {
      _logger.debug("start(): idToken == null");
      return const SignInResult.cancelled();
    }

    final request = GoogleSignInStartRequest(idToken: idToken);
    final response = await authRemoteService.startGoogleSignIn(request).safe(_logger);

    if (response == null) {
      _logger.warn("start(): response == null");
      return const SignInResult.serverError();
    } else if (response.isSuccess) {
      _logger.debug("start(): response is success");
      await authSessionRepository.saveSession(response.data.jwtToken, !response.data.isRegistered);
      return const SignInResult.success();
    } else {
      _logger.debug("start(): response is error");
      return const SignInResult.serverError();
    }
  }

  Future<String?> _openFormAndGetIdToken() async {
    _logger.debug("openFormAndGetIdToken()");

    try {
      final account = await googleSignIn.signIn();
      if (account == null) {
        _logger.debug("openFormAndGetIdToken: account = null");
        return null;
      }

      final authentication = await account.authentication;
      _logger.debug("openFormAndGetIdToken: authentication loaded");
      return authentication.idToken;
    } on Exception catch (ex, trace) {
      _logger.error("openFormAndGetIdToken: error during request", exception: ex, stacktrace: trace);
      return null;
    }
  }
}
