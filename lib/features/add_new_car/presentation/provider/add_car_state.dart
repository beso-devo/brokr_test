import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_car_state.freezed.dart';

part 'add_car_state.g.dart';

@freezed
abstract class AddCarState with _$AddCarState {
  const factory AddCarState({
    @Default("") String name,
    @Default("") String phoneNumber,
    @Default(false) bool errorNicknameValidation,
    @Default(false) bool errorPhoneNumberValidation,
    @Default(false) bool beneficiaryAdded,
    @Default(false) bool isAddingBeneficiary,
    @Default(false) bool errorAddingBeneficiary,
  }) = _AddCarState;

  factory AddCarState.fromJson(Map<String, dynamic> json) =>
      _$AddCarStateFromJson(json);
}
