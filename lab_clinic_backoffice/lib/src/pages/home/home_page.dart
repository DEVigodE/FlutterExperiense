import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinic_backoffice/src/pages/home/home_controller.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with MessageViewMixin {
  final formKey = GlobalKey<FormState>();
  final deskNumberEC = TextEditingController();
  final controller = Injector.get<HomeController>();

  @override
  void initState() {
    messageListener(controller);
    effect(() {
      if (controller.informationForm != null) {
        Navigator.of(context).pushReplacementNamed('/pre-checkin', arguments: controller.informationForm);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    deskNumberEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: LabClinicAppBar(),
      body: Center(
        child: Form(
          key: formKey,
          child: Container(
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
                  const Text(
                    'Bem Vindo!',
                    style: LabClinicTheme.titleStyle,
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Preencha o número do guichê que você está atendendo',
                    style: LabClinicTheme.subtitleStyle,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: deskNumberEC,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    validator: Validatorless.multiple([
                      Validatorless.required('Guichê obrigatório'),
                      Validatorless.number('Apenas números'),
                    ]),
                    decoration: const InputDecoration(
                      labelText: 'Número do guichê',
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        final formValid = formKey.currentState?.validate() ?? false;
                        if (formValid) {
                          controller.startService(int.parse(deskNumberEC.text));
                        }
                      },
                      child: const Text('CHAMAR PRÓXIMO PACIENTE'),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
