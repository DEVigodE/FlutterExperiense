import 'package:json_annotation/json_annotation.dart';

part 'patient_addess_model.g.dart';

@JsonSerializable()
class PatientAddessModel {
  PatientAddessModel({
    required this.cep,
    required this.streetAddress,
    required this.number,
    required this.addressComplement,
    required this.state,
    required this.city,
    required this.district,
  });

  @JsonKey(name: 'cep', defaultValue: '')
  String cep;
  @JsonKey(name: 'street_address')
  String streetAddress;
  String number;
  @JsonKey(name: 'address_complement')
  String addressComplement;
  String state;
  String city;
  String district;

  factory PatientAddessModel.fromJson(Map<String, dynamic> json) => _$PatientAddessModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientAddessModelToJson(this);
}
