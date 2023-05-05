import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:musicday_mobile/auth/repositories/auth_session_repository.dart';
import 'package:musicday_mobile/auth/ui/auth_container_state.dart';
import 'package:musicday_mobile/core/logging/logger.dart';
import 'package:musicday_mobile/core/logging/logger_factory.dart';

@Injectable()
class AuthContainerBloc extends Cubit<AuthContainerState> {
  final Logger _logger;
  final AuthSessionRepository authSessionRepository;
  late StreamSubscription _sessionSubscription;

  AuthContainerBloc({
    required LoggerFactory loggerFactory,
    required this.authSessionRepository,
  })  : _logger = loggerFactory.create("AuthContainerBloc"),
        super(const AuthContainerState.loading()) {
    _logger.debug("init");
    _sessionSubscription = authSessionRepository.currentSession.listen((session) {
      if (session == null) {
        _logger.debug("sessionSubscription: session == null");
        emit(const AuthContainerState.nonAuthorized());
      } else if (session.isAuthorizationToken) {
        _logger.debug("sessionSubscription: session.isAuthorizationToken == true");
        emit(const AuthContainerState.inRegistration());
      } else {
        _logger.debug("sessionSubscription: session.isAuthorizationToken == false");
        emit(const AuthContainerState.authorized());
      }
    });
  }

  /// Удаляет сессию из БД.
  Future<void> onSessionClosed() {
    _logger.debug("onSessionClosed()");
    return authSessionRepository.deleteSession();
  }

  @override
  Future<void> close() async {
    _logger.debug("close");
    await _sessionSubscription.cancel();
    return await super.close();
  }
}
