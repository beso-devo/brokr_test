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
      carAdded: json['carAdded'] as bool? ?? false,
      isAddingCar: json['isAddingCar'] as bool? ?? false,
      errorAddingCar: json['errorAddingCar'] as bool? ?? false,
    );

Map<String, dynamic> _$$AddCarStateImplToJson(_$AddCarStateImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'errorNicknameValidation': instance.errorNicknameValidation,
      'errorPhoneNumberValidation': instance.errorPhoneNumberValidation,
      'carAdded': instance.carAdded,
      'isAddingCar': instance.isAddingCar,
      'errorAddingCar': instance.errorAddingCar,
    };
