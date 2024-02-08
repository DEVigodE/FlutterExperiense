import 'package:lab_clinic_self_service/src/model/patient_model.dart';
import 'package:lab_clinic_self_service/src/repositories/patient/patient_repository.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

class FindPatientController with MessageStateMixin {
  FindPatientController({required PatientRepository patientRepository}) : _patientRepository = patientRepository;

  final PatientRepository _patientRepository;
  final _patientNoutFound = ValueSignal<bool?>(null);
  final _patient = ValueSignal<PatientModel?>(null);

  bool? get patientNotFound => _patientNoutFound();
  PatientModel? get patient => _patient();

  Future<void> findPatientByDocument(String document) async {
    final patientResult = await _patientRepository.findPatientByDocument(document);

    bool patientNotFound;
    PatientModel? patient;

    switch (patientResult) {
      case Left():
        showError('Erro ao buscar paciente');
        patientNotFound = true;
        break;
      case Right(value: PatientModel model?):
        patientNotFound = false;
        patient = model;
        break;
      case Right(value: _):
        patientNotFound = true;
        patient = null;
        break;
    }

    batch(() {
      _patient.value = patient;
      _patientNoutFound.forceUpdate(patientNotFound);
    });
  }

  void continueWithoutDocument() {
    batch(() {
      _patient.value = null;
      _patientNoutFound.forceUpdate(true);
    });
  }
}
