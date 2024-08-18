// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_car_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddCarStateImpl _$$AddCarStateImplFromJson(Map<String, dynamic> json) =>
    _$AddCarStateImpl(
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

Map<String, dynamic> _$$AddCarStateImplToJson(_$AddCarStateImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'errorNicknameValidation': instance.errorNicknameValidation,
      'errorPhoneNumberValidation': instance.errorPhoneNumberValidation,
      'beneficiaryAdded': instance.beneficiaryAdded,
      'isAddingBeneficiary': instance.isAddingBeneficiary,
      'errorAddingBeneficiary': instance.errorAddingBeneficiary,
    };
