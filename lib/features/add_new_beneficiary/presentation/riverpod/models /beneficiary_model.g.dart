// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beneficiary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BeneficiaryModelS _$BeneficiaryModelSFromJson(Map<String, dynamic> json) =>
    BeneficiaryModelS(
      (json['id'] as num).toInt(),
      json['nick_name'] as String,
      json['phone_number'] as String,
    );

Map<String, dynamic> _$BeneficiaryModelSToJson(BeneficiaryModelS instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nick_name': instance.nickName,
      'phone_number': instance.phoneNumber,
    };
