import 'package:musicday_mobile/auth/models/sign_up_result.dart';

abstract class SignUpInteractor {
  /// Производит регистрацию пользователя в текущей сессии.
  Future<SignUpResult> signUp(String nickname, String username);
}
