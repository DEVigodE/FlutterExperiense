import 'package:asyncstate/asyncstate.dart';
import 'package:lab_clinic_panel/src/services/login/user_login_service.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

class LoginController with MessageStateMixin {
  LoginController({
    required UserLoginService loginService,
  }) : _loginService = loginService;

  final UserLoginService _loginService;

  final _obscurePassword = signal(true);
  bool get obscurePassword => _obscurePassword.value;
  void toggleObscurePassword() => _obscurePassword.value = !_obscurePassword.value;

  final _logged = signal(false);
  bool get logged => _logged.value;

  void login(String email, String password) async {
    final loginResult = await _loginService.execute(email, password).asyncLoader();
    switch (loginResult) {
      case Left(value: ServiceException(:final message)):
        showError(message);
      case Right(value: _):
        _logged.value = true;
    }
  }
}
