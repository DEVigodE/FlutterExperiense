import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:lab_clinic_self_service/src/model/patient_model.dart';
import 'package:lab_clinic_self_service/src/model/self_service_model.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

import './information_form_repository.dart';

class InformationFormRepositoryImpl implements InformationFormRepository {
  final RestClient restClient;

  InformationFormRepositoryImpl({required this.restClient});

  @override
  Future<Either<RepositoryException, Unit>> register(SelfServiceModel model) async {
    try {
      final SelfServiceModel(
        :name!,
        :lastName!,
        patient: PatientModel(id: patientId)!,
        documents: {
          DocumentType.healthInsurance: List(first: healthInsuranceCardDoc),
          DocumentType.medicalOrder: medicalOrderDocs,
        }!
      ) = model;

      await restClient.post(
        '/patientInformationForm',
        data: {
          'patient_id': patientId,
          'health_insurance_card': healthInsuranceCardDoc,
          'medical_order': medicalOrderDocs,
          'password': '$name $lastName',
          'date_created': DateTime.now().toIso8601String(),
          'status': 'Waiting',
          'test': []
        },
      );

      return Right(unit);
    } on DioException catch (e, s) {
      log('Erro ao finalizar formulário de auto atendimento', error: e, stackTrace: s);
      return Left(RepositoryException());
    }
  }
}
