import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:gap/gap.dart';
import 'package:lab_clinic_backoffice/src/models/patient_information_form_model.dart';
import 'package:lab_clinic_backoffice/src/pages/checkin/checkin_controller.dart';
import 'package:lab_clinic_backoffice/src/pages/checkin/widget/checkin_image_link.dart';
import 'package:lab_clinic_backoffice/src/shared/data_item.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

class CheckinPage extends StatefulWidget {
  const CheckinPage({super.key});

  @override
  State<CheckinPage> createState() => _CheckinPageState();
}

class _CheckinPageState extends State<CheckinPage> with MessageViewMixin {
  final controller = Injector.get<CheckinController>();

  @override
  void initState() {
    messageListener(controller);
    effect(() {
      if (controller.endProcess.value) {
        Navigator.of(context).pushReplacementNamed('/end-checkin');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final PatientInformationFormModel(
      :password,
      :patient,
      :medicalOrders,
      :healthInsuranceCard,
    ) = controller.informationForm.watch(context)!;

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
                  'As senha chamada foi',
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
                  child: Text(
                    password,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Gap(48),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: LabClinicTheme.lightOrangeColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    "Dados do paciente",
                    style: LabClinicTheme.subtitleStyle.copyWith(color: LabClinicTheme.orangeColor, fontWeight: FontWeight.bold),
                  ),
                ),
                const Gap(24),
                DataItem(label: 'Nome Paciente', value: patient.name, padding: const EdgeInsets.only(bottom: 24)),
                DataItem(label: 'Email', value: patient.email, padding: const EdgeInsets.only(bottom: 24)),
                DataItem(label: 'Telefone de contato', value: patient.phoneNumber, padding: const EdgeInsets.only(bottom: 24)),
                DataItem(label: 'CPF', value: patient.document, padding: const EdgeInsets.only(bottom: 24)),
                DataItem(label: 'CEP', value: patient.address.cep, padding: const EdgeInsets.only(bottom: 24)),
                DataItem(
                  label: 'Endereço',
                  value: '${patient.address.streetAddress}, '
                      '${patient.address.number}, '
                      '${patient.address.addressComplement}, '
                      '${patient.address.district}, '
                      '${patient.address.city} - ${patient.address.state}',
                  padding: const EdgeInsets.only(bottom: 24),
                ),
                DataItem(label: 'Responsável', value: patient.guardian, padding: const EdgeInsets.only(bottom: 24)),
                DataItem(
                    label: 'Documento de indentificação', value: patient.guardianIdentigicationNumber, padding: const EdgeInsets.only(bottom: 24)),
                const Gap(24),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: LabClinicTheme.lightOrangeColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    "Validar Imagens Exames e Documentos",
                    style: LabClinicTheme.subtitleStyle.copyWith(color: LabClinicTheme.orangeColor, fontWeight: FontWeight.bold),
                  ),
                ),
                const Gap(24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CheckinImageLink(label: 'Carteirinha', image: healthInsuranceCard),
                    Column(
                      children: [
                        for (final (index, medicalOrder) in medicalOrders.indexed)
                          CheckinImageLink(label: 'Padido Medico ${index + 1}', image: medicalOrder),
                      ],
                    ),
                  ],
                ),
                const Gap(24),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(fixedSize: const Size.fromHeight(48)),
                    onPressed: () {
                      controller.endCheckin();
                    },
                    child: const Text('FINALIZAR ATENDIMENTO'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
