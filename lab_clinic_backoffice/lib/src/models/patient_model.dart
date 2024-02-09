import 'package:json_annotation/json_annotation.dart';
import 'package:lab_clinic_backoffice/src/models/patient_addess_model.dart';

part 'patient_model.g.dart';

@JsonSerializable()
class PatientModel {
  PatientModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.document,
    required this.address,
    required this.guardian,
    required this.guardianIdentigicationNumber,
  });

  String id;
  String name;
  @JsonKey(name: 'phone_number')
  String phoneNumber;
  String document;
  PatientAddessModel address;
  @JsonKey(defaultValue: '')
  String guardian;
  @JsonKey(name: 'guardian_identigication_number')
  String guardianIdentigicationNumber;

  factory PatientModel.fromJson(Map<String, dynamic> json) => _$PatientModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientModelToJson(this);
}