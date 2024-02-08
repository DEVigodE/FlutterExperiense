import 'package:flutter/material.dart';
import 'package:lab_clinic_self_service/src/model/patient_model.dart';
import 'package:lab_clinic_self_service/src/modules/self_service/patient/patient_page.dart';
import 'package:lab_clinic_self_service/src/repositories/patient/patient_repository.dart';

mixin PatientFormController on State<PatientPage> {
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final phoneEC = TextEditingController();
  final documentEC = TextEditingController();
  final cepEC = TextEditingController();
  final addressEC = TextEditingController();
  final numberEC = TextEditingController();
  final complementEC = TextEditingController();
  final stateEC = TextEditingController();
  final cityEC = TextEditingController();
  final districtEC = TextEditingController();
  final guardianEC = TextEditingController();
  final guardianDocumentEC = TextEditingController();

  void disposeForm() {
    nameEC.dispose();
    emailEC.dispose();
    phoneEC.dispose();
    documentEC.dispose();
    cepEC.dispose();
    addressEC.dispose();
    numberEC.dispose();
    complementEC.dispose();
    stateEC.dispose();
    cityEC.dispose();
    districtEC.dispose();
    guardianEC.dispose();
    guardianDocumentEC.dispose();
  }

  void initializeForm(final PatientModel? model) {
    if (model != null) {
      nameEC.text = model.name;
      emailEC.text = model.email;
      phoneEC.text = model.phoneNumber;
      documentEC.text = model.document;
      cepEC.text = model.address.cep;
      addressEC.text = model.address.streetAddress;
      numberEC.text = model.address.number;
      complementEC.text = model.address.addressComplement;
      stateEC.text = model.address.state;
      cityEC.text = model.address.city;
      districtEC.text = model.address.district;
      guardianEC.text = model.guardian;
      guardianDocumentEC.text = model.guardianIdentificationNumber;
    }
  }

  PatientModel updatePatient(PatientModel patient) {
    return patient.copyWith(
      name: nameEC.text,
      email: emailEC.text,
      phoneNumber: phoneEC.text,
      document: documentEC.text,
      address: patient.address.copyWith(
        cep: cepEC.text,
        streetAddress: addressEC.text,
        number: numberEC.text,
        addressComplement: complementEC.text,
        state: stateEC.text,
        city: cityEC.text,
        district: districtEC.text,
      ),
      guardian: guardianEC.text,
      guardianIdentificationNumber: guardianDocumentEC.text,
    );
  }

  RegisterPatientModel createPatientRegister() {
    return (
      name: nameEC.text,
      email: emailEC.text,
      phoneNumber: phoneEC.text,
      document: documentEC.text,
      address: (
        cep: cepEC.text,
        streetAddress: addressEC.text,
        number: numberEC.text,
        addressComplement: complementEC.text,
        state: stateEC.text,
        city: cityEC.text,
        district: districtEC.text,
      ),
      guardian: guardianEC.text,
      guardianIdentificationNumber: guardianDocumentEC.text,
    );
  }
}
