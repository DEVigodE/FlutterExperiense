import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinic_backoffice/src/core/env.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class LabClinicApplicationBindings extends ApplicationBindings {
  @override
  List<Bind<Object>> bindings() => [
        Bind.lazySingleton((i) => RestClient(Env.backendBaseUrl)),
      ];
}
