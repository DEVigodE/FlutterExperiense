import 'package:flutter/material.dart';
import 'package:lab_clinic_backoffice/src/shared/data_item.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class PreCheckinPage extends StatelessWidget {
  const PreCheckinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LabClinicAppBar(),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.5,
            padding: const EdgeInsets.all(40),
            margin: const EdgeInsets.only(top: 56),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: LabClinicTheme.orangeColor),
            ),
            child: Column(
              children: [
                Image.asset('assets/images/patient_avatar.png'),
                const SizedBox(height: 16),
                const Text(
                  'A senha chamada foi',
                  style: LabClinicTheme.titleSmallStyle,
                ),
                const SizedBox(height: 16),
                Container(
                  constraints: const BoxConstraints(
                    minWidth: 218,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 24,
                  ),
                  decoration: BoxDecoration(
                    color: LabClinicTheme.orangeColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    '123123',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                const DataItem(label: 'Nome Paciente', value: 'Igor de Oliveira', padding: EdgeInsets.only(bottom: 24)),
                const DataItem(label: 'Email', value: 'Igor de Oliveira', padding: EdgeInsets.only(bottom: 24)),
                const DataItem(label: 'Telefone de contato', value: 'Igor de Oliveira', padding: EdgeInsets.only(bottom: 24)),
                const DataItem(label: 'CPF', value: 'Igor de Oliveira', padding: EdgeInsets.only(bottom: 24)),
                const DataItem(label: 'CEP', value: 'Igor de Oliveira', padding: EdgeInsets.only(bottom: 24)),
                const DataItem(label: 'Endereço', value: 'Igor de Oliveira', padding: EdgeInsets.only(bottom: 24)),
                const DataItem(label: 'Responsável', value: 'Igor de Oliveira', padding: EdgeInsets.only(bottom: 24)),
                const DataItem(label: 'Documento de indentificação', value: 'Igor de Oliveira', padding: EdgeInsets.only(bottom: 24)),
                const SizedBox(height: 48),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(fixedSize: const Size.fromHeight(48)),
                        onPressed: () {},
                        child: const Text('CHAMAR OUTRA SENHA'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(fixedSize: const Size.fromHeight(48)),
                        onPressed: () {},
                        child: const Text('ATENDER'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
