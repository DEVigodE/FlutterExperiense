import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinic_self_service/src/core/env.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class LabClinicApplicationBindig extends ApplicationBindings {
  @override
  List<Bind<Object>> bindings() => [
        Bind.lazySingleton<RestClient>((i) => RestClient(Env.backendBaseUrl)),
      ];
}
