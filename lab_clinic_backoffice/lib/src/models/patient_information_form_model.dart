import 'package:json_annotation/json_annotation.dart';
import 'package:lab_clinic_backoffice/src/models/patient_model.dart';

part 'patient_information_form_model.g.dart';

@JsonEnum(valueField: 'id')
enum PatientInformationFormsStatus {
  waiting('Waiting'),
  beingAttended('Being Attended'),
  checkIn('Checked In');

  final String id;
  const PatientInformationFormsStatus(this.id);
}

@JsonSerializable()
class PatientInformationFormModel {
  PatientInformationFormModel({
    required this.id,
    required this.patient,
    required this.healthInsuranceCard,
    required this.medicalOrders,
    required this.password,
    required this.dateCreated,
    required this.status,
  });

  final String id;
  final PatientModel patient;
  @JsonKey(name: 'health_insurance_card')
  final String healthInsuranceCard;
  @JsonKey(name: 'medical_order')
  final List<String> medicalOrders;
  final String password;
  @JsonKey(name: 'date_created')
  final DateTime dateCreated;
  final PatientInformationFormsStatus status;

  factory PatientInformationFormModel.fromJson(Map<String, dynamic> json) => _$PatientInformationFormModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientInformationFormModelToJson(this);
}
