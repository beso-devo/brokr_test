import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

part 'sign_up_state.g.dart';

@freezed
abstract class SignUpState with _$SignUpState {
  const factory SignUpState({
    @Default(false) bool errorUserNameValidation,
    @Default(false) bool errorPasswordValidation,
    @Default(false) bool errorSignUp,
    @Default(false) bool isPasswordSecureText,
    @Default(false) bool isSigningUp,
    @Default(false) bool userSignedUp,
    @Default(false) bool isConfirmPasswordSecure,
    @Default(false) bool errorPhoneNumberValidation,
    @Default("") String email,
    @Default("") String password,
    @Default("") String confirmPassword,
    @Default("") String phoneNumber,
  }) = _SignUpState;

  factory SignUpState.fromJson(Map<String, dynamic> json) =>
      _$SignUpStateFromJson(json);
}

