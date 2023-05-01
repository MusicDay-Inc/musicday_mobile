import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:musicday_mobile/auth/interactors/google_sign_in_interactor.dart';
import 'package:musicday_mobile/auth/ui/intro/intro_screen_event.dart';
import 'package:musicday_mobile/auth/ui/intro/intro_screen_state.dart';
import 'package:musicday_mobile/core/logging/logger.dart';
import 'package:musicday_mobile/core/logging/logger_factory.dart';

@Injectable()
class IntroScreenBloc extends Bloc<IntroScreenEvent, IntroScreenState> {
  final Logger _logger;

  IntroScreenBloc({
    required LoggerFactory loggerFactory,
    required GoogleSignInInteractor googleSignInInteractor,
  })  : _logger = loggerFactory.create("IntroScreenBloc"),
        super(const IntroScreenState.idle()) {
    _logger.debug("init");

    on<IntroScreenEvent>((event, emit) async {
      _logger.debug("IntroScreenEvent: received");

      emit(const IntroScreenState.loading());
      (await googleSignInInteractor.start()).when(
        success: () => _logger.debug("IntroScreenEvent: success"),
        cancelled: () {
          _logger.debug("IntroScreenEvent: cancelled");
          emit(const IntroScreenState.idle());
        },
        serverError: () {
          _logger.debug("IntroScreenEvent: serverError");
          emit(const IntroScreenState.serverError());
        },
      );
    });
  }
}
