import 'package:lab_clinic_backoffice/src/models/patient_information_form_model.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

abstract interface class PatientInformationFormRepository {
  Future<Either<RepositoryException, PatientInformationFormModel?>> callNextToCheckin();
  Future<Either<RepositoryException, Unit>> updateStatus(String id, PatientInformationFormsStatus status);
}
