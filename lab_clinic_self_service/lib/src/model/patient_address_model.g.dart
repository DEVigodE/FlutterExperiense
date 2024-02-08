// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientAddressModel _$PatientAddressModelFromJson(Map<String, dynamic> json) =>
    PatientAddressModel(
      number: json['number'] as String,
      addressComplement: json['address_complement'] as String? ?? '',
      cep: json['cep'] as String,
      streetAddress: json['street_address'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      district: json['district'] as String,
    );

Map<String, dynamic> _$PatientAddressModelToJson(
        PatientAddressModel instance) =>
    <String, dynamic>{
      'cep': instance.cep,
      'street_address': instance.streetAddress,
      'city': instance.city,
      'state': instance.state,
      'district': instance.district,
      'number': instance.number,
      'address_complement': instance.addressComplement,
    };
