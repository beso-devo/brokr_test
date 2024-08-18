// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignInStateImpl _$$SignInStateImplFromJson(Map<String, dynamic> json) =>
    _$SignInStateImpl(
      errorUserNameValidation:
          json['errorUserNameValidation'] as bool? ?? false,
      errorPasswordValidation:
          json['errorPasswordValidation'] as bool? ?? false,
      errorSignIn: json['errorSignIn'] as bool? ?? false,
      isSecureText: json['isSecureText'] as bool? ?? false,
      isSigningIn: json['isSigningIn'] as bool? ?? false,
      userSignedIn: json['userSignedIn'] as bool? ?? false,
      email: json['email'] as String? ?? "",
      password: json['password'] as String? ?? "",
    );

Map<String, dynamic> _$$SignInStateImplToJson(_$SignInStateImpl instance) =>
    <String, dynamic>{
      'errorUserNameValidation': instance.errorUserNameValidation,
      'errorPasswordValidation': instance.errorPasswordValidation,
      'errorSignIn': instance.errorSignIn,
      'isSecureText': instance.isSecureText,
      'isSigningIn': instance.isSigningIn,
      'userSignedIn': instance.userSignedIn,
      'email': instance.email,
      'password': instance.password,
    };
