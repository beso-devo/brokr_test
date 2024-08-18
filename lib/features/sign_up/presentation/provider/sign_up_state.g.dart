// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignUpStateImpl _$$SignUpStateImplFromJson(Map<String, dynamic> json) =>
    _$SignUpStateImpl(
      errorUserNameValidation:
          json['errorUserNameValidation'] as bool? ?? false,
      errorPasswordValidation:
          json['errorPasswordValidation'] as bool? ?? false,
      errorSignUp: json['errorSignUp'] as bool? ?? false,
      isPasswordSecureText: json['isPasswordSecureText'] as bool? ?? false,
      isSigningUp: json['isSigningUp'] as bool? ?? false,
      userSignedUp: json['userSignedUp'] as bool? ?? false,
      isConfirmPasswordSecure:
          json['isConfirmPasswordSecure'] as bool? ?? false,
      errorPhoneNumberValidation:
          json['errorPhoneNumberValidation'] as bool? ?? false,
      email: json['email'] as String? ?? "",
      password: json['password'] as String? ?? "",
      confirmPassword: json['confirmPassword'] as String? ?? "",
      phoneNumber: json['phoneNumber'] as String? ?? "",
    );

Map<String, dynamic> _$$SignUpStateImplToJson(_$SignUpStateImpl instance) =>
    <String, dynamic>{
      'errorUserNameValidation': instance.errorUserNameValidation,
      'errorPasswordValidation': instance.errorPasswordValidation,
      'errorSignUp': instance.errorSignUp,
      'isPasswordSecureText': instance.isPasswordSecureText,
      'isSigningUp': instance.isSigningUp,
      'userSignedUp': instance.userSignedUp,
      'isConfirmPasswordSecure': instance.isConfirmPasswordSecure,
      'errorPhoneNumberValidation': instance.errorPhoneNumberValidation,
      'email': instance.email,
      'password': instance.password,
      'confirmPassword': instance.confirmPassword,
      'phoneNumber': instance.phoneNumber,
    };
