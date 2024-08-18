// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_new_beneficiary_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddBeneficiaryStateImpl _$$AddBeneficiaryStateImplFromJson(
        Map<String, dynamic> json) =>
    _$AddBeneficiaryStateImpl(
      name: json['name'] as String? ?? "",
      phoneNumber: json['phoneNumber'] as String? ?? "",
      errorNicknameValidation:
          json['errorNicknameValidation'] as bool? ?? false,
      errorPhoneNumberValidation:
          json['errorPhoneNumberValidation'] as bool? ?? false,
      beneficiaryAdded: json['beneficiaryAdded'] as bool? ?? false,
      isAddingBeneficiary: json['isAddingBeneficiary'] as bool? ?? false,
      errorAddingBeneficiary: json['errorAddingBeneficiary'] as bool? ?? false,
    );

Map<String, dynamic> _$$AddBeneficiaryStateImplToJson(
        _$AddBeneficiaryStateImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'errorNicknameValidation': instance.errorNicknameValidation,
      'errorPhoneNumberValidation': instance.errorPhoneNumberValidation,
      'beneficiaryAdded': instance.beneficiaryAdded,
      'isAddingBeneficiary': instance.isAddingBeneficiary,
      'errorAddingBeneficiary': instance.errorAddingBeneficiary,
    };
