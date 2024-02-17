import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:gap/gap.dart';
import 'package:lab_clinic_backoffice/src/pages/end_checkin/end_checkin_controller.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

class EndCheckinPage extends StatefulWidget {
  const EndCheckinPage({super.key});

  @override
  State<EndCheckinPage> createState() => _EndCheckinPageState();
}

class _EndCheckinPageState extends State<EndCheckinPage> with MessageViewMixin {
  final controller = Injector.get<EndCheckinController>();

  @override
  void initState() {
    messageListener(controller);

    effect(() {
      if (controller.informationForm.value != null) {
        Navigator.of(context).pushReplacementNamed('/pre-checkin', arguments: controller.informationForm.value);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: LabClinicAppBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
            margin: const EdgeInsets.only(top: 56),
            padding: const EdgeInsets.all(40),
            width: sizeOf.width * 0.4,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: LabClinicTheme.orangeColor),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/check_icon.png'),
                const Gap(40),
                const Text(
                  'Atendimento Finalizado com Sucesso!',
                  style: LabClinicTheme.titleSmallStyle,
                ),
                const Gap(80),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.callNextPatient();
                    },
                    child: const Text('CHAMAR OUTRA SENHA'),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
