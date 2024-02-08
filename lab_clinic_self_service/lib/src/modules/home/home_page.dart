import 'package:flutter/material.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: LabClinicAppBar(
        actions: [
          PopupMenuButton<int>(
              child: const IconPopupMenuWidget(),
              itemBuilder: (context) {
                return [
                  const PopupMenuItem<int>(
                    value: 1,
                    child: Text('Iniciar Terminal'),
                  ),
                  const PopupMenuItem<int>(
                    value: 2,
                    child: Text('Finalizar Terminal'),
                  )
                ];
              })
        ],
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
            margin: const EdgeInsets.only(top: 110),
            padding: const EdgeInsets.all(40),
            width: sizeOf.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: LabClinicTheme.orangeColor,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Bem vindo!',
                  style: LabClinicTheme.titleStyle,
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: sizeOf.width * 0.8,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/self-service');
                    },
                    child: const Text('Iniciar Terminal'),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
