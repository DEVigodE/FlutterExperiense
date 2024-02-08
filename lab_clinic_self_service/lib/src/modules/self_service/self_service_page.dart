import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinic_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

class SelfServicePage extends StatefulWidget {
  const SelfServicePage({super.key});

  @override
  State<SelfServicePage> createState() => _SelfServicePageState();
}

class _SelfServicePageState extends State<SelfServicePage> with MessageViewMixin {
  final controller = Injector.get<SelfServiceController>();

  @override
  void initState() {
    messageListener(controller);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.startProcess();
      effect(() {
        var baseRoute = '/self-service/';
        final step = controller.step;
        switch (step) {
          case FormSteps.none:
          case FormSteps.whoIAm:
            baseRoute += 'who-i-am';
          case FormSteps.findPatient:
            baseRoute += 'find-patient';
          case FormSteps.patient:
            baseRoute += 'patient';
          case FormSteps.documents:
            baseRoute += 'documents';
          case FormSteps.done:
            //Navigator.of(context).pushNamedAndRemoveUntil('/', ModalRoute.withName('/self-service'), arguments: controller.password);
            //return;
            baseRoute += 'done';
          case FormSteps.restart:
            Navigator.of(context).popUntil(ModalRoute.withName('/self-service'));
            controller.startProcess();
            return;
        }
        Navigator.of(context).pushNamed(baseRoute);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
