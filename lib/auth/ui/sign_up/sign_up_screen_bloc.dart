import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:musicday_mobile/auth/interactors/sign_up_interactor.dart';
import 'package:musicday_mobile/auth/ui/sign_up/sign_up_screen_event.dart';
import 'package:musicday_mobile/auth/ui/sign_up/sign_up_screen_state.dart';
import 'package:musicday_mobile/core/logging/logger.dart';
import 'package:musicday_mobile/core/logging/logger_factory.dart';

@Injectable()
class SignUpScreenBloc extends Bloc<SignUpScreenEvent, SignUpScreenState> {
  final Logger _logger;

  SignUpScreenBloc({
    required LoggerFactory loggerFactory,
    required SignUpInteractor signUpInteractor,
  })  : _logger = loggerFactory.create("SignUpScreenBloc"),
        super(const SignUpScreenState.idle()) {
    _logger.debug("init");
    on<SignUpScreenEvent>((event, emit) async {
      _logger.debug("SignUpScreenEvent: received");

      await event.when(doneClick: (nickname, username) async {
        _logger.debug("SignUpScreenEvent: received doneClick");
        emit(const SignUpScreenState.loading());
        (await signUpInteractor.signUp(nickname, username)).whenOrNull(
          serverError: () {
            _logger.debug("SignUpScreenEvent(doneClick, serverError)");
            emit(const SignUpScreenState.serverError());
          },
          invalidFormat: (isNicknameInvalid, isUsernameInvalid) {
            _logger.debug(
                "SignUpScreenEvent(doneClick, invalidFormat): isNicknameInvalid = $isNicknameInvalid, isUsernameInvalid = $isUsernameInvalid");
            emit(SignUpScreenState.invalidFormat(isNicknameInvalid, isUsernameInvalid));
          },
        );
      });
    });
  }
}
