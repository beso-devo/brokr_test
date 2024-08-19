import 'package:brokr/features/splash/domain/usecases/check_user_logged_id.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/domain/usecases/usecase.dart';
import 'splash_state.dart';

part 'splash_logic.g.dart';

@riverpod
class SplashLogic extends _$SplashLogic {
  CheckUserIsLoggedIn checkUserIsLoggedIn = getIt<CheckUserIsLoggedIn>();

  @override
  SplashState build() {
    return const SplashState();
  }

  Future<void> mapToCheckUserStatus() async {
    print("mapToCheckUserStatus");
    final result = await checkUserIsLoggedIn(NoParams());
    print("done");
    await result.fold((l) async {
      print("lllllll = ");
    }, (r) async {
      print("rrr = $r");
      state = state.copyWith(userStatus: r);
    });
  }
}
