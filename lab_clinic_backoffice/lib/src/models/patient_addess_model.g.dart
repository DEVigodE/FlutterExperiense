// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_addess_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientAddessModel _$PatientAddessModelFromJson(Map<String, dynamic> json) =>
    PatientAddessModel(
      cep: json['cep'] as String? ?? '',
      streetAddress: json['street_address'] as String,
      number: json['number'] as String,
      addressComplement: json['address_complement'] as String,
      state: json['state'] as String,
      city: json['city'] as String,
      district: json['district'] as String,
    );

Map<String, dynamic> _$PatientAddessModelToJson(PatientAddessModel instance) =>
    <String, dynamic>{
      'cep': instance.cep,
      'street_address': instance.streetAddress,
      'number': instance.number,
      'address_complement': instance.addressComplement,
      'state': instance.state,
      'city': instance.city,
      'district': instance.district,
    };
