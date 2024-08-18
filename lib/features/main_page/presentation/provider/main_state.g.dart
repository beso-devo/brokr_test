// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MainStateImpl _$$MainStateImplFromJson(Map<String, dynamic> json) =>
    _$MainStateImpl(
      isLoadingCars: json['isLoadingCars'] as bool? ?? false,
      errorLoadingCars: json['errorLoadingCars'] as bool? ?? false,
      carsLoaded: json['carsLoaded'] as bool? ?? false,
      email: json['email'] as String? ?? "",
      password: json['password'] as String? ?? "",
    );

Map<String, dynamic> _$$MainStateImplToJson(_$MainStateImpl instance) =>
    <String, dynamic>{
      'isLoadingCars': instance.isLoadingCars,
      'errorLoadingCars': instance.errorLoadingCars,
      'carsLoaded': instance.carsLoaded,
      'email': instance.email,
      'password': instance.password,
    };
