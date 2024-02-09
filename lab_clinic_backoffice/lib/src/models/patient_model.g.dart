// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientModel _$PatientModelFromJson(Map<String, dynamic> json) => PatientModel(
      id: json['id'] as String,
      name: json['name'] as String,
      phoneNumber: json['phone_number'] as String,
      document: json['document'] as String,
      address:
          PatientAddessModel.fromJson(json['address'] as Map<String, dynamic>),
      guardian: json['guardian'] as String? ?? '',
      guardianIdentigicationNumber:
          json['guardian_identigication_number'] as String,
    );

Map<String, dynamic> _$PatientModelToJson(PatientModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone_number': instance.phoneNumber,
      'document': instance.document,
      'address': instance.address,
      'guardian': instance.guardian,
      'guardian_identigication_number': instance.guardianIdentigicationNumber,
    };
