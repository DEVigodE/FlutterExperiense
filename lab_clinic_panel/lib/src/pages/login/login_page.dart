import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinic_panel/src/pages/login/login_controller.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with MessageViewMixin {
  final formkey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  final controller = Injector.get<LoginController>();

  @override
  void initState() {
    messageListener(controller);
    effect(() => {
          if (controller.logged) Navigator.of(context).pushReplacementNamed("/home"),
        });
    super.initState();
  }

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(minHeight: sizeOf.height),
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
              constraints: BoxConstraints(maxWidth: sizeOf.width * 0.4),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    const Text(
                      "Login",
                      style: LabClinicTheme.titleStyle,
                    ),
                    const SizedBox(height: 32),
                    TextFormField(
                      controller: emailEC..text = 'admin1@email.com',
                      validator: Validatorless.multiple(
                        [
                          Validatorless.required("E-mail obrigatório"),
                          Validatorless.email("E-mail inválido"),
                        ],
                      ),
                      decoration: const InputDecoration(
                        labelText: "E-mail",
                      ),
                    ),
                    const SizedBox(height: 24),
                    Watch((_) {
                      return TextFormField(
                        obscureText: controller.obscurePassword,
                        validator: Validatorless.required("Senha obrigatória"),
                        controller: passwordEC..text = '123123',
                        decoration: InputDecoration(
                          labelText: "Senha",
                          suffixIcon: IconButton(
                            onPressed: controller.toggleObscurePassword,
                            icon: Icon(controller.obscurePassword ? Icons.visibility : Icons.visibility_off),
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: sizeOf.width * .8,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {
                            final valid = formkey.currentState?.validate() ?? false;
                            if (valid) {
                              controller.login(emailEC.text, passwordEC.text);
                            }
                          },
                          child: const Text("Entrar")),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
