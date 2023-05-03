import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:musicday_mobile/auth/interactors/sign_up_interactor.dart';
import 'package:musicday_mobile/auth/ui/sign_up/sign_up_screen_event.dart';
import 'package:musicday_mobile/auth/ui/sign_up/sign_up_screen_state.dart';

@Injectable()
class SignUpScreenBloc extends Bloc<SignUpScreenEvent, SignUpScreenState> {
  SignUpScreenBloc({required SignUpInteractor signUpInteractor}) : super(const SignUpScreenState.idle()) {
    on<SignUpScreenEvent>((event, emit) async {
      await event.when(doneClick: (nickname, username) async {
        emit(const SignUpScreenState.loading());
        (await signUpInteractor.signUp(nickname, username)).whenOrNull(
          serverError: () => emit(const SignUpScreenState.serverError()),
          invalidFormat: (isNicknameInvalid, isUsernameInvalid) {
            emit(SignUpScreenState.invalidFormat(isNicknameInvalid, isUsernameInvalid));
          },
        );
      });
    });
  }
}
