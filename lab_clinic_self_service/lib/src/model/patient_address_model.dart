import 'package:json_annotation/json_annotation.dart';

part 'patient_address_model.g.dart';

@JsonSerializable()
class PatientAddressModel {
  PatientAddressModel({
    required this.number,
    required this.addressComplement,
    required this.cep,
    required this.streetAddress,
    required this.city,
    required this.state,
    required this.district,
  });

  final String cep;
  @JsonKey(name: 'street_address')
  final String streetAddress;
  final String city;
  final String state;
  final String district;
  final String number;
  @JsonKey(name: 'address_complement', defaultValue: '')
  final String addressComplement;

  factory PatientAddressModel.fromJson(Map<String, dynamic> json) => _$PatientAddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientAddressModelToJson(this);

  PatientAddressModel copyWith({
    String? cep,
    String? streetAddress,
    String? city,
    String? state,
    String? district,
    String? number,
    String? addressComplement,
  }) {
    return PatientAddressModel(
      cep: cep ?? this.cep,
      streetAddress: streetAddress ?? this.streetAddress,
      city: city ?? this.city,
      state: state ?? this.state,
      district: district ?? this.district,
      number: number ?? this.number,
      addressComplement: addressComplement ?? this.addressComplement,
    );
  }
}
