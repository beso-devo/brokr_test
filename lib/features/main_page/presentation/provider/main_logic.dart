import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'main_state.dart';

part 'main_logic.g.dart';

@riverpod
class MainLogic extends _$MainLogic {
  @override
  MainState build() {
    return const MainState();
  }

  Future<void> getCars() async {}

}
