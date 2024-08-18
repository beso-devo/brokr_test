import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/di/injection_container.dart';
import '../../../../core/domain/usecases/save_user_info_usecase.dart';
import '../../../../core/util/validator/input_validators.dart';
import '../../domain/usecases/continue_as_guest_usecase.dart';
import '../../domain/usecases/sign_up_usecase.dart';
import 'sign_up_state.dart';

part 'sign_up_logic.g.dart';

@riverpod
class SignUpLogic extends _$SignUpLogic {
  SignUpUseCase signUpUseCase = getIt<SignUpUseCase>();
  SaveUserInfoUseCase saveUserInfoUseCase = getIt<SaveUserInfoUseCase>();
  InputValidators inputValidators = getIt<InputValidators>();
  ContinueAsGuestUseCase continueAsGuestUseCase =
      getIt<ContinueAsGuestUseCase>();

  @override
  SignUpState build() {
    return const SignUpState();
  }

  void changeEmail(String email) {
    state = state.copyWith(email: email);
  }

  void changePassword(String password) {
    state = state.copyWith(password: password);
  }

  void changeConfirmPassword(String password) {
    state = state.copyWith(confirmPassword: password);
  }

  void changePhoneNumber(String phone) {
    state = state.copyWith(phoneNumber: phone);
  }

  void passwordObscureChanged() {
    state = state.copyWith(isPasswordSecureText: !state.isPasswordSecureText);
  }

  void confirmPasswordObscureChanged() {
    state = state.copyWith(isConfirmPasswordSecure: !state.isConfirmPasswordSecure);
  }

  void clearData() {
    state = state.copyWith(errorSignUp: false);
  }

  Future<void> continueAsGuest() async {}

  Future<void> submit() async {
    if (!inputValidators.validateEmail(state.email)) {
      state = state.copyWith(errorUserNameValidation: true);
    } else if (!inputValidators.validatePasswordInput(state.password)) {
      state = state.copyWith(errorPasswordValidation: true);
    } else {
      await signUp();
    }
  }

  Future<void> signUp() async {
    state = state.copyWith(
        isSigningUp: true, errorSignUp: false, userSignedUp: false);
    final result = await signUpUseCase(SignUpParams(
        password: state.password,
        confirmPassword: state.confirmPassword,
        email: state.email,
        phoneNumber: state.phoneNumber));
    await result.fold((l) async {
      state = state.copyWith(
          isSigningUp: false, errorSignUp: true, userSignedUp: false);
    }, (r) async {
      // Here also we can do some other logic...
      state = state.copyWith(
          isSigningUp: false, errorSignUp: false, userSignedUp: true);
    });
  }
}
