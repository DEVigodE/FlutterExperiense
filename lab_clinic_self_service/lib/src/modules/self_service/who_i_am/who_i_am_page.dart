import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinic_self_service/src/modules/self_service/self_service_controller.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';

class WhoIAmPage extends StatefulWidget {
  const WhoIAmPage({super.key});

  @override
  State<WhoIAmPage> createState() => _WhoIAmPageState();
}

class _WhoIAmPageState extends State<WhoIAmPage> with MessageViewMixin {
  final formkey = GlobalKey<FormState>();
  final firstNameEC = TextEditingController();
  final lastNameEC = TextEditingController();

  final controller = Injector.get<SelfServiceController>();

  @override
  void initState() {
    messageListener(controller);
    effect(() => {
          //if (controller.logged) Navigator.of(context).pushReplacementNamed("/home"),
        });
    super.initState();
  }

  @override
  void dispose() {
    firstNameEC.dispose();
    lastNameEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        firstNameEC.clear();
        lastNameEC.clear();
        controller.clearForm();
      },
      child: Scaffold(
        appBar: LabClinicAppBar(
          actions: [
            PopupMenuButton<int>(
              child: const IconPopupMenuWidget(),
              itemBuilder: (context) {
                return [
                  const PopupMenuItem<int>(
                    value: 1,
                    child: Text('Finalizar Terminal'),
                  ),
                ];
              },
              onSelected: (value) async {
                if (value == 1) {
                  controller.clearForm();
                  await SharedPreferences.getInstance().then((prefs) {
                    prefs.clear();
                    Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
                  });
                }
              },
            )
          ],
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background_login.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(40),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  constraints: BoxConstraints(maxWidth: sizeOf.width * 0.8),
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        Image.asset('assets/images/logo_vertical.png'),
                        const SizedBox(height: 48),
                        const Text(
                          "Bem- vindo!",
                          style: LabClinicTheme.titleStyle,
                        ),
                        const SizedBox(height: 48),
                        TextFormField(
                          controller: firstNameEC..text = 'Igor de Oliveira',
                          validator: Validatorless.required("Nome obrigatório"),
                          decoration: const InputDecoration(
                            labelText: "Digite seu nome",
                          ),
                        ),
                        const SizedBox(height: 24),
                        Watch((_) {
                          return TextFormField(
                            validator: Validatorless.required("Sobrenome obrigatória"),
                            controller: lastNameEC..text = 'Bittecourt Moreira',
                            decoration: const InputDecoration(
                              labelText: "Digite seu sobrenome",
                            ),
                          );
                        }),
                        const SizedBox(height: 32),
                        SizedBox(
                          width: sizeOf.width * .8,
                          height: 48,
                          child: ElevatedButton(
                              onPressed: () {
                                final valid = formkey.currentState?.validate() ?? false;
                                if (valid) {
                                  controller.setWhoIAmDataStepAndNext(firstNameEC.text, lastNameEC.text);
                                }
                              },
                              child: const Text("Continuar")),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
