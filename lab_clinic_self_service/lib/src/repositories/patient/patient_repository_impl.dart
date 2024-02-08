import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:lab_clinic_self_service/src/model/patient_model.dart';
import 'package:lab_clinic_self_service/src/repositories/patient/patient_repository.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

class PatientRepositoryImpl implements PatientRepository {
  final RestClient restClient;

  PatientRepositoryImpl({required this.restClient});

  @override
  Future<Either<RepositoryException, PatientModel?>> findPatientByDocument(String document) async {
    try {
      final Response(:List data) = await restClient.auth.get('/patients', queryParameters: {'document': document});
      if (data.isEmpty) {
        return Right(null);
      }
      return Right(PatientModel.fromJson(data.first));
    } on DioException catch (e, s) {
      log('Error ao buscar paciente por CPF', error: e, stackTrace: s);
      return Left(RepositoryException());
    }
  }

  @override
  Future<Either<RepositoryException, Unit>> update(PatientModel patient) async {
    try {
      await restClient.auth.put('/patients/${patient.id}', data: patient.toJson());
      return Right(unit);
    } on DioException catch (e, s) {
      log('Error ao atualizar paciente', error: e, stackTrace: s);
      return Left(RepositoryException());
    }
  }

  @override
  Future<Either<RepositoryException, PatientModel>> create(RegisterPatientModel patient) async {
    try {
      final Response(:data) = await restClient.auth.post('/patients', data: {
        'name': patient.name,
        'email': patient.email,
        'phone_number': patient.phoneNumber,
        'document': patient.document,
        'address': {
          'cep': patient.address.cep,
          'street_address': patient.address.streetAddress,
          'city': patient.address.city,
          'state': patient.address.state,
          'district': patient.address.district,
          'number': patient.address.number,
          'address_complement': patient.address.addressComplement,
        },
        'guardian': patient.guardian,
        'guardian_identification_number': patient.guardianIdentificationNumber,
      });
      return Right(PatientModel.fromJson(data));
    } on DioException catch (e, s) {
      log('Error ao cadastrar paciente', error: e, stackTrace: s);
      return Left(RepositoryException());
    }
  }
}
