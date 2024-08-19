import 'package:brokr/core/di/injection_container.dart';
import 'package:brokr/features/main_page/domain/repository/dealer_main_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'main_state.dart';

part 'main_logic.g.dart';

@riverpod
class MainLogic extends _$MainLogic {
  MainPageRepository mainPageRepository = getIt<MainPageRepository>();

  @override
  MainState build() {
    return const MainState();
  }

  Future<void> getBoats() async {
    state = state.copyWith(
        isLoadingBoats: true, errorLoadingBoats: false, boatsLoaded: false);
    final result = await mainPageRepository.getBoats();
    await result.fold((l) async {
      state = state.copyWith(
          isLoadingBoats: false, errorLoadingBoats: true, boatsLoaded: false);
    }, (r) async {
      state = state.copyWith(
          isLoadingBoats: false,
          errorLoadingBoats: false,
          boatsLoaded: true,
          boats: r);
    });
  }

  Future<void> updateBoat() async {
    /// We'll do the same logic inside create car and fetch the boats...
    ///
    /// Same architecture for the other methods (delete, update, create...).
  }
}
