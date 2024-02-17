import 'package:lab_clinic_backoffice/src/models/patient_information_form_model.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

class CheckinController with MessageStateMixin {
  final informationForm = signal<PatientInformationFormModel?>(null);
}
