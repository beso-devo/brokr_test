import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/util/validator/input_validators.dart';
import '../../domain/usecases/add_new_beneficiary_usecase.dart';
import 'add_new_beneficiary_state.dart';

part 'add_new_beneficiary_riverpod.g.dart';

@riverpod
class AddBeneficiaryLogic extends _$AddBeneficiaryLogic {
  @override
  AddBeneficiaryState build() {
    return const AddBeneficiaryState(phoneNumber: "", name: "");
  }

  void changeName(String name) {
    state = state.copyWith(name: name, errorNicknameValidation: false);
  }

  void changePhoneNumber(String phoneNumber) {
    state = state.copyWith(
        phoneNumber: phoneNumber, errorPhoneNumberValidation: false);
  }

  Future<void> submit() async {
    final inputValidators = getIt<InputValidators>();
    if (state.name.length > 20 || state.name.length < 5) {
      state = state.copyWith(errorNicknameValidation: true);
    } else if (!inputValidators.validateUAEPhoneInput(state.phoneNumber)) {
      state = state.copyWith(errorPhoneNumberValidation: true);
    } else {
      await addNewBeneficiary();
    }
  }

  Future<void> addNewBeneficiary() async {
    state = state.copyWith(
        isAddingBeneficiary: true,
        errorAddingBeneficiary: false,
        beneficiaryAdded: false);


    state = state.copyWith(
        isAddingBeneficiary: false,
        errorAddingBeneficiary: false,
        beneficiaryAdded: true);

    /// In this way we can call the api methods.
    // final result = await addNewBeneficiaryUseCase(SubmitNewBeneficiaryParams(
    //     phoneNumber: state.phoneNumber, nickname: state.name));
    // await result.fold((l) async* {
    //   state = state.copyWith(
    //       failure: l,
    //       isAddingBeneficiary: false,
    //       errorAddingBeneficiary: true,
    //       beneficiaryAdded: false);
    // }, (r) async* {
    //   state = state.copyWith(
    //       isAddingBeneficiary: false,
    //       errorAddingBeneficiary: false,
    //       beneficiaryAdded: true);
    // });
  }
}
