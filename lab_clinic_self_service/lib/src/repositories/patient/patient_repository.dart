import 'package:lab_clinic_self_service/src/model/patient_model.dart';
import 'package:lab_clinicas_core/lab_clinicas_core.dart';

typedef RegisterPatientAddressModel = ({
  String cep,
  String streetAddress,
  String city,
  String state,
  String district,
  String number,
  String addressComplement,
});

typedef RegisterPatientModel = ({
  String name,
  String email,
  String phoneNumber,
  String document,
  RegisterPatientAddressModel address,
  String guardian,
  String guardianIdentificationNumber
});

abstract interface class PatientRepository {
  Future<Either<RepositoryException, PatientModel?>> findPatientByDocument(String document);
  Future<Either<RepositoryException, Unit>> update(PatientModel patient);
  Future<Either<RepositoryException, PatientModel>> create(RegisterPatientModel patient);
}
