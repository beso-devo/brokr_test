import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/util/validator/input_validators.dart';
import 'sign_in_state.dart';

part 'sign_in_logic.g.dart';

@riverpod
class SignInLogic extends _$SignInLogic {
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

  Future<void> signIn() async {}
}
