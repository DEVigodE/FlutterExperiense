import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinic_self_service/src/modules/auth/login/login_router.dart';
import 'package:lab_clinic_self_service/src/repositories/user/user_repository.dart';
import 'package:lab_clinic_self_service/src/repositories/user/user_repository_impl.dart';

class AuthModule extends FlutterGetItModule {
  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<UserRepository>((i) => UserRepositoryImpl(restClient: i())),
        //Bind.lazySingleton<UserLoginService>((i) => UserLoginServiceImpl(userRepository: i())),
      ];

  @override
  String get moduleRouteName => '/auth';

  @override
  Map<String, WidgetBuilder> get pages => {
        '/login': (context) => const LoginRouter(),
        // '/register': (context) => const RegisterScreen(),
      };
}
