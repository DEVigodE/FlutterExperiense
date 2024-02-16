import 'package:lab_clinic_backoffice/src/models/patient_information_form_model.dart';
import 'package:lab_clinic_backoffice/src/services/call_next_patient/call_next_patient_service.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

class PreCheckinController with MessageStateMixin {
  PreCheckinController({required CallNextPatientService callNextPatientService}) : _callNextPatientService = callNextPatientService;

  final CallNextPatientService _callNextPatientService;

  final informationForm = signal<PatientInformationFormModel?>(null);

  Future<void> callNextPatient() async {
    final result = await _callNextPatientService.execute();
    switch (result) {
      case Left():
        showError('Erro ao chamar paciente');
      case Right(value: final form?):
        informationForm.value = form;
      case Right():
        showInfo('Nenhum paciente na fila de espera');
    }
  }
}
