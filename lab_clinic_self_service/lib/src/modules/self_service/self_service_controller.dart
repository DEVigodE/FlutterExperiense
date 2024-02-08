import 'package:asyncstate/asyncstate.dart';
import 'package:lab_clinic_self_service/src/model/patient_model.dart';
import 'package:lab_clinic_self_service/src/model/self_service_model.dart';
import 'package:lab_clinic_self_service/src/repositories/information_form/information_form_repository.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

enum FormSteps {
  none,
  whoIAm,
  findPatient,
  patient,
  documents,
  done,
  restart,
}

class SelfServiceController with MessageStateMixin {
  SelfServiceController({
    required this.informationFormRepository,
  });

  final InformationFormRepository informationFormRepository;

  final _step = ValueSignal(FormSteps.none);
  var _model = const SelfServiceModel();
  var password = '';

  FormSteps get step => _step();
  SelfServiceModel get model => _model;

  void startProcess() {
    _step.forceUpdate(FormSteps.whoIAm);
  }

  void setWhoIAmDataStepAndNext(String name, String lastName) {
    _model = _model.copyWith(
      name: () => name,
      lastName: () => lastName,
    );
    _step.forceUpdate(FormSteps.findPatient);
  }

  void clearForm() {
    _model = _model.clear();
  }

  void goToFormPatient(PatientModel? patient) {
    _model = _model.copyWith(
      patient: () => patient,
    );
    _step.forceUpdate(FormSteps.patient);
  }

  void restartProcess() {
    _step.forceUpdate(FormSteps.restart);
    clearForm();
  }

  void updatePatientAndGoDocument(PatientModel? patient) {
    _model = _model.copyWith(patient: () => patient);
    _step.forceUpdate(FormSteps.documents);
  }

  void registerDocument(DocumentType type, String filePath) {
    final documents = _model.documents ?? {};
    if (type == DocumentType.healthInsurance) {
      documents[type]?.clear();
    }

    final values = documents[type] ?? [];
    values.add(filePath);

    documents[type] = values;

    _model = _model.copyWith(documents: () => documents);
  }

  void clearDocuments() {
    _model = _model.copyWith(documents: () => {});
  }

  Future<void> finalize() async {
    final result = await informationFormRepository.register(model).asyncLoader();
    switch (result) {
      case Left():
        showError('Erro ao finalizar formulário de auto atendimento');
        break;
      case Right():
        password = '${model.name} ${model.lastName}';
        _step.forceUpdate(FormSteps.done);
        break;
    }
  }
}
