import 'package:musicday_mobile/auth/models/sign_in_result.dart';

abstract class GoogleSignInInteractor {
  /// Запускает процесс авторизации.
  Future<SignInResult> start();
}
