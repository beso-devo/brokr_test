import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/domain/usecases/save_user_info_usecase.dart';
import '../../../../core/util/validator/input_validators.dart';
import '../../domain/usecases/sign_in_usecase.dart';
import 'sign_in_state.dart';

part 'sign_in_logic.g.dart';

@riverpod
class SignInLogic extends _$SignInLogic {
  SignInUseCase signInUseCase = getIt<SignInUseCase>();
  SaveUserInfoUseCase saveUserInfoUseCase = getIt<SaveUserInfoUseCase>();

  @override
  SignInState build() {
    return const SignInState();
  }

  void changeEmail(String email) {
    state = state.copyWith(email: email);
  }

  void changePassword(String password) {
    state = state.copyWith(password: password);
  }

  void changeSecureText() {
    state = state.copyWith(isSecureText: !state.isSecureText);
  }

  void clearData() {
    state = state.copyWith(errorSignIn: false);
  }

  Future<void> submit() async {
    final inputValidators = getIt<InputValidators>();
    if (!inputValidators.validateEmail(state.email)) {
      state = state.copyWith(errorUserNameValidation: true);
    } else if (!inputValidators.validatePasswordInput(state.password)) {
      state = state.copyWith(errorPasswordValidation: true);
    } else {
      await signIn();
    }
  }

  Future<void> signIn() async {
    state = state.copyWith(
        isSigningIn: true, errorSignIn: false, userSignedIn: false);
    final result =
        await signInUseCase(SignInParams(state.email, state.password));
    await result.fold((l) async {
      state = state.copyWith(
          isSigningIn: false, errorSignIn: true, userSignedIn: false);
    }, (r) async {
      state = state.copyWith(
          isSigningIn: false, errorSignIn: false, userSignedIn: true);
    });
  }
}
