import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.freezed.dart';

part 'sign_in_state.g.dart';

@freezed
abstract class SignInState with _$SignInState {
  const factory SignInState({
    @Default(false) bool errorUserNameValidation,
    @Default(false) bool errorPasswordValidation,
    @Default(false) bool errorSignIn,
    @Default(false) bool isSecureText,
    @Default(false) bool isSigningIn,
    @Default(false) bool userSignedIn,
    @Default("") String email,
    @Default("") String password,
  }) = _SignInState;

  factory SignInState.fromJson(Map<String, dynamic> json) =>
      _$SignInStateFromJson(json);
}



