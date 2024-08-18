import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/domain/entity/beneficiary_entity.dart';
import '../../../../core/domain/entity/top_up_entity.dart';
import '../../../../core/domain/usecases/get_user_info_usecase.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/util/constants.dart';
import '../../domain/usecases/get_beneficiaries_usecase.dart';
import 'main_page_event.dart';
import 'main_page_state.dart';

@Injectable()
class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  final GetBeneficiariesUseCase getBeneficiariesUseCase;
  final GetUserInfoUseCase getUserInfoUseCase;

  MainPageBloc(
    this.getBeneficiariesUseCase,
    this.getUserInfoUseCase,
  ) : super(MainPageState.initial());

  void onInitializePage() {
    add(InitializePage());
  }

  void onAddNewBeneficiary(BeneficiaryEntity beneficiaryEntity) {
    add(AddBeneficiary(beneficiaryEntity));
  }

  void onClearErrors() {
    add(ClearErrors());
  }

  void onTopUpAdded(TopUpEntity topUpEntity) {
    add(TopUpAdded(topUpEntity));
  }

  @override
  Stream<MainPageState> mapEventToState(MainPageEvent event) async* {
    if (event is InitializePage) {
      yield* getCurrentUser();
      yield* getUserBeneficiaries();
    } else if (event is AddBeneficiary) {
      yield* addBeneficiary(event);
    } else if (event is ClearErrors) {
      yield state.rebuild((p0) => p0
        ..failure = null
        ..errorAddNewBeneficiary = false
        ..newBeneficiaryAdded = false);
    } else if (event is TopUpAdded) {
      yield state
          .rebuild((p0) => p0..historyTopUPs!.insert(0, event.topUpEntity));
      yield* getCurrentUser();
    }
  }

  Stream<MainPageState> addBeneficiary(AddBeneficiary event) async* {
    /// Here also we have to send the request to the backend to add it
    /// into the database so we have to add new usecase and new function
    /// in the remote data source of this page but right now we don't care
    /// about the data so it's fine...

    if (state.beneficiaries.length <= 4) {
      yield state.rebuild((p0) => p0
        ..beneficiaries!.insert(0, event.beneficiaryEntity)
        ..newBeneficiaryAdded = true);
    } else {
      yield state.rebuild((p0) => p0
        ..errorAddNewBeneficiary = true
        ..failure = ServerFailure(ErrorCode.ERROR_ADD_BENEFICIARY));
    }
  }

  Stream<MainPageState> getCurrentUser() async* {
    final result = await getUserInfoUseCase(NoParams());
    yield* result.fold((l) async* {}, (r) async* {
      yield state.rebuild((p0) => p0..currentUser = r);
    });
  }

  Stream<MainPageState> getUserBeneficiaries() async* {
    yield state.rebuild((p0) => p0
      ..isLoadingBeneficiaries = true
      ..errorLoadingBeneficiaries = false
      ..beneficiariesLoaded = false);
    final result = await getBeneficiariesUseCase(NoParams());
    yield* result.fold((l) async* {
      yield state.rebuild((p0) => p0
        ..failure = l
        ..isLoadingBeneficiaries = false
        ..errorLoadingBeneficiaries = false
        ..beneficiariesLoaded = false);
    }, (r) async* {
      yield state.rebuild((p0) => p0
            ..isLoadingBeneficiaries = false
            ..errorLoadingBeneficiaries = false
            ..beneficiariesLoaded = true
          // ..beneficiaries = r
          );
    });
  }
}
