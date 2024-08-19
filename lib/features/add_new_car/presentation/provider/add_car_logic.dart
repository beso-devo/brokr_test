import 'package:brokr/features/add_new_car/domain/usecases/add_car_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/util/validator/input_validators.dart';
import 'add_car_state.dart';

part 'add_car_logic.g.dart';

@riverpod
class AddCarLogic extends _$AddCarLogic {
  final AddCarUseCase addCarUseCase = getIt<AddCarUseCase>();

  @override
  AddCarState build() {
    return const AddCarState(phoneNumber: "", name: "");
  }

  void changeTitle(String name) {
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
        isAddingCar: true,
        errorAddingCar: false,
        carAdded: false);

    /// Here we can pass whatever what we need to pass for the parameters.
    final result = await addCarUseCase(CarParams("", ""));
    await result.fold((l) async {
      state = state.copyWith(
          isAddingCar: false,
          errorAddingCar: true,
          carAdded: false);
    }, (r) async {
      state = state.copyWith(
          isAddingCar: false,
          errorAddingCar: false,
          carAdded: true);
    });

    /// This state only for demo so we must remove it....
    state = state.copyWith(
        isAddingCar: true,
        errorAddingCar: false,
        carAdded: true);
  }
}
