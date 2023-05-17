import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:musicday_mobile/auth/interactors/google_sign_out_interactor.dart';
import 'package:musicday_mobile/auth/repositories/auth_session_repository.dart';
import 'package:musicday_mobile/core/logging/logger.dart';
import 'package:musicday_mobile/core/logging/logger_factory.dart';

@Singleton(as: GoogleSignOutInteractor)
class GoogleSignOutInteractorImpl extends GoogleSignOutInteractor {
  final AuthSessionRepository authSessionRepository;
  final GoogleSignIn googleSignIn;
  final Logger _logger;

  GoogleSignOutInteractorImpl({
    required this.authSessionRepository,
    required this.googleSignIn,
    required LoggerFactory loggerFactory,
  }) : _logger = loggerFactory.create("GoogleSignOutInteractorImpl");

  @override
  Future<void> signOut() async {
    _logger.debug("signOut()");
    await authSessionRepository.deleteSession();

    try {
      await googleSignIn.signOut();
    } catch (ex, stack) {
      _logger.warn("signOut(), google error", stacktrace: stack, exception: ex);
    }
  }
}
