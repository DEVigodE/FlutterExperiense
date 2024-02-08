import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinic_backoffice/src/pages/login/login_controller.dart';
import 'package:lab_clinic_backoffice/src/pages/login/login_page.dart';
import 'package:lab_clinic_backoffice/src/repositories/user/user_repository.dart';
import 'package:lab_clinic_backoffice/src/repositories/user/user_repository_impl.dart';
import 'package:lab_clinic_backoffice/src/services/login/user_login_service.dart';
import 'package:lab_clinic_backoffice/src/services/login/user_login_service_impl.dart';

class LoginRouter extends FlutterGetItPageRouter {
  const LoginRouter({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<UserRepository>((i) => UserRepositoryImpl(restClient: i())),
        Bind.lazySingleton<UserLoginService>((i) => UserLoginServiceImpl(userRepository: i())),
        Bind.lazySingleton((i) => LoginController(loginService: i())),
      ];

  @override
  WidgetBuilder get view => (context) => const LoginPage();

  @override
  String get routeName => '/login';
}
