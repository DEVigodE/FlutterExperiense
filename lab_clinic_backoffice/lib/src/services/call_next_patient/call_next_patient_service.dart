import 'dart:developer';

import 'package:lab_clinic_backoffice/src/models/patient_information_form_model.dart';
import 'package:lab_clinic_backoffice/src/repositories/attendant_desk_assignment/attendant_desk_assignment_repository.dart';
import 'package:lab_clinic_backoffice/src/repositories/painel/painel_respository.dart';
import 'package:lab_clinic_backoffice/src/repositories/patient_information_form/patient_information_form_repository.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class CallNextPatientService {
  CallNextPatientService({
    required this.painelRespository,
    required this.patientInformationFormRepository,
    required this.attendantDeskAssignmentRepository,
  });

  final PatientInformationFormRepository patientInformationFormRepository;
  final AttendantDeskAssignmentRepository attendantDeskAssignmentRepository;
  final PainelRespository painelRespository;

  Future<Either<RepositoryException, PatientInformationFormModel?>> execute() async {
    final result = await patientInformationFormRepository.callNextToCheckin();
    switch (result) {
      case Left(value: final exception):
        return Left(exception);
      case Right(value: final form?):
        return updatePanel(form);
      case Right():
        return Right(null);
    }
  }

  Future<Either<RepositoryException, PatientInformationFormModel?>> updatePanel(form) async {
    final resultDesk = await attendantDeskAssignmentRepository.getDeskAssingment();
    switch (resultDesk) {
      case Left(value: final exception):
        return Left(exception);
      case Right(value: final deskNumber):
        final painelResult = await painelRespository.callOnPanel(form.password, deskNumber);
        switch (painelResult) {
          case Left(value: final exception):
            log('ATENÇÃO !!!! Erro ao chamar pacient no painel',
                error: exception, stackTrace: StackTrace.fromString('ATENÇÃO !!!! Erro ao chamar pacient no painel'));
            return Right(form);
          case Right():
            return Right(form);
        }
    }
  }
}
