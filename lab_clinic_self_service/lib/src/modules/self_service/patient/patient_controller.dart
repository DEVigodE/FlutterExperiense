import 'package:lab_clinic_self_service/src/model/patient_model.dart';
import 'package:lab_clinic_self_service/src/repositories/patient/patient_repository.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

class PatientController with MessageStateMixin {
  PatientController({required PatientRepository repository}) : _repository = repository;

  final PatientRepository _repository;
  PatientModel? patient;
  final _nextStep = signal<bool>(false);
  bool get nextStep => _nextStep();

  void goNextStep() {
    _nextStep.value = true;
  }

  void updateAndNext(PatientModel patient) async {
    final updateResult = await _repository.update(patient);
    switch (updateResult) {
      case Left():
        showError('Erro ao atualizar paciente');
        break;
      case Right():
        showInfo('Paciente atualizado com sucesso');
        patient = patient;
        goNextStep();
        break;
    }
  }

  Future<void> saveAndNext(RegisterPatientModel patient) async {
    final result = await _repository.create(patient);
    switch (result) {
      case Left():
        showError('Erro ao cadastrar paciente, chame o atendente');
        break;
      case Right(value: final patient):
        showInfo('Paciente cadastrado com sucesso');
        this.patient = patient;
        goNextStep();
        break;
    }
  }
}
