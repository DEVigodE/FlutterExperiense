import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinic_panel/src/binding/lab_clinic_application_bindings.dart';
import 'package:lab_clinic_panel/src/pages/login/login_router.dart';
import 'package:lab_clinic_panel/src/pages/splash/splash_page.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

void main() {
  runApp(const LabClinicsPainelApp());
}

class LabClinicsPainelApp extends StatelessWidget {
  const LabClinicsPainelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LabClinicasCoreConfig(
      title: "Lab Clinicas Painel",
      binding: LabClinicApplicationBindings(),
      pages: const [LoginRouter()],
      pagesBuilders: [
        FlutterGetItPageBuilder(path: '/', page: (_) => const SplashPage()),
        FlutterGetItPageBuilder(path: '/home', page: (_) => const Text('HOME')),
      ],
    );
  }
}
