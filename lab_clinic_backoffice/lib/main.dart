import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinic_backoffice/src/bindings/lab_clinic_application_bindings.dart';
import 'package:lab_clinic_backoffice/src/pages/home/home_router.dart';
import 'package:lab_clinic_backoffice/src/pages/login/login_router.dart';
import 'package:lab_clinic_backoffice/src/pages/splash/splash_page.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const LabClinicBackoffice());
  }, (error, stack) {
    log('Erro não tratado', error: error, stackTrace: stack);
    throw error;
  });
}

class LabClinicBackoffice extends StatelessWidget {
  const LabClinicBackoffice({super.key});

  @override
  Widget build(BuildContext context) {
    return LabClinicasCoreConfig(
      title: 'LabClinic Backoffice',
      binding: LabClinicApplicationBindings(),
      pagesBuilders: [
        FlutterGetItPageBuilder(page: (_) => const SplashPage(), path: '/'),
      ],
      pages: const [LoginRouter(), HomeRouter()],
    );
  }
}
