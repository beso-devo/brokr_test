import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/entity/beneficiary_entity.dart';

part 'add_new_beneficiary_state.freezed.dart';

part 'add_new_beneficiary_state.g.dart';

@freezed
abstract class AddBeneficiaryState with _$AddBeneficiaryState {
  const factory AddBeneficiaryState({
    @Default("") String name,
    @Default("") String phoneNumber,
    @Default(false) bool errorNicknameValidation,
    @Default(false) bool errorPhoneNumberValidation,
    @Default(false) bool beneficiaryAdded,
    @Default(false) bool isAddingBeneficiary,
    @Default(false) bool errorAddingBeneficiary,
  }) = _AddBeneficiaryState;

  factory AddBeneficiaryState.fromJson(Map<String, dynamic> json) =>
      _$AddBeneficiaryStateFromJson(json);
}
