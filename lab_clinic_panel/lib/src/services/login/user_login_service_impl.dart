import 'package:lab_clinic_panel/src/repositories/user/user_repository.dart';
import 'package:lab_clinic_panel/src/services/login/user_login_service.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLoginServiceImpl implements UserLoginService {
  UserLoginServiceImpl({required this.userRepository});

  final UserRepository userRepository;

  @override
  Future<Either<ServiceException, Unit>> execute(String email, String password) async {
    final loginResult = await userRepository.login(email, password);
    switch (loginResult) {
      case Left(value: AuthError(/*:final message*/)):
        return Left(ServiceException(message: 'Erro ao realizar login'));
      case Left(value: AuthUnauthorizedException()):
        return Left(ServiceException(message: 'Usuário ou senha inválidos'));
      case Right(value: final accessToken):
        await SharedPreferences.getInstance().then((prefs) => prefs.setString(LocalStorageConstants.accessToken, accessToken));
        return Right(unit);
    }
  }
}
