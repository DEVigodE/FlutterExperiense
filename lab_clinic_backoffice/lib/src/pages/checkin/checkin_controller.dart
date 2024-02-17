import 'package:lab_clinic_backoffice/src/models/patient_information_form_model.dart';
import 'package:lab_clinic_backoffice/src/repositories/patient_information_form/patient_information_form_repository.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

class CheckinController with MessageStateMixin {
  CheckinController({
    required PatientInformationFormRepository patientInformationFormRepository,
  }) : _patientInformationFormRepository = patientInformationFormRepository;
  final informationForm = signal<PatientInformationFormModel?>(null);
  final PatientInformationFormRepository _patientInformationFormRepository;
  final endProcess = signal(false);

  Future<void> endCheckin() async {
    if (informationForm.value != null) {
      final result = await _patientInformationFormRepository.updateStatus(informationForm.value!.id, PatientInformationFormsStatus.beingAttended);
      switch (result) {
        case Left():
          showError('Erro ao atualizar o status do formulário de informações do paciente');
        case Right():
          endProcess.value = true;
      }
    } else {
      showError('Não foi possível finalizar o checkin');
    }
  }
}
