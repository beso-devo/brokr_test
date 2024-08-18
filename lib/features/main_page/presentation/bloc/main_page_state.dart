import 'package:built_value/built_value.dart';

import '../../../../core/domain/entity/beneficiary_entity.dart';
import '../../../../core/domain/entity/top_up_entity.dart';
import '../../../../core/domain/entity/user_entity.dart';
import '../../../../core/error/failures.dart';

part 'main_page_state.g.dart';

abstract class MainPageState
    implements Built<MainPageState, MainPageStateBuilder> {
  MainPageState._();

  UserEntity? get currentUser;

  bool get isLoadingInfo;
  bool get isLoadingBeneficiaries;
  bool get errorLoadingBeneficiaries;
  bool get beneficiariesLoaded;
  List<BeneficiaryEntity> get beneficiaries;

  bool get errorAddNewBeneficiary;
  bool get newBeneficiaryAdded;

  Failure? get failure;

  List<TopUpEntity> get historyTopUPs;

  factory MainPageState([updates(MainPageStateBuilder b)]) = _$MainPageState;

  factory MainPageState.initial() {
    return MainPageState((b) => b
      ..historyTopUPs = []
      ..isLoadingInfo = false
      ..isLoadingBeneficiaries = false
      ..errorLoadingBeneficiaries = false
      ..beneficiariesLoaded = false
      ..errorAddNewBeneficiary = false
      ..newBeneficiaryAdded = false
      ..beneficiaries = [
        BeneficiaryEntity(
            id: 1, nickName: 'Amit Pahandit', phoneNumber: '+971552711410'),
        BeneficiaryEntity(
            id: 2, nickName: 'Kumar Suresh', phoneNumber: '+971504141232'),
        BeneficiaryEntity(
            id: 3, nickName: 'Amit Pahandit', phoneNumber: '+971523342424'),
      ]);
  }
}
