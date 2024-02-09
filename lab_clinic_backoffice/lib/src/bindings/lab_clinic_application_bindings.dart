import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinic_backoffice/src/core/env.dart';
import 'package:lab_clinic_backoffice/src/repositories/attendant_desk_assignment/attendant_desk_assignment_repository.dart';
import 'package:lab_clinic_backoffice/src/repositories/attendant_desk_assignment/attendant_desk_assignment_repository_impl.dart';
import 'package:lab_clinic_backoffice/src/repositories/painel/painel_respository.dart';
import 'package:lab_clinic_backoffice/src/repositories/painel/painel_respository_impl.dart';
import 'package:lab_clinic_backoffice/src/repositories/patient_information_form/patient_information_form_repository.dart';
import 'package:lab_clinic_backoffice/src/repositories/patient_information_form/patient_information_form_repository_impl.dart';
import 'package:lab_clinic_backoffice/src/services/call_next_patient/call_next_patient_service.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class LabClinicApplicationBindings extends ApplicationBindings {
  @override
  List<Bind<Object>> bindings() => [
        Bind.lazySingleton((i) => RestClient(Env.backendBaseUrl)),
        Bind.lazySingleton<PatientInformationFormRepository>((i) => PatientInformationFormRepositoryImpl(restClient: i())),
        Bind.lazySingleton<AttendantDeskAssignmentRepository>((i) => AttendantDeskAssignmentRepositoryImpl(restClient: i())),
        Bind.lazySingleton<PainelRespository>((i) => PainelRespositoryImpl(restClient: i())),
        Bind.lazySingleton((i) => CallNextPatientService(
              painelRespository: i(),
              patientInformationFormRepository: i(),
              attendantDeskAssignmentRepository: i(),
            ))
      ];
}
