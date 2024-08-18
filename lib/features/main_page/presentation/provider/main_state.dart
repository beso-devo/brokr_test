import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_state.freezed.dart';

part 'main_state.g.dart';

@freezed
abstract class MainState with _$MainState {
  const factory MainState({
    @Default(false) bool isLoadingCars,
    @Default(false) bool errorLoadingCars,
    @Default(false) bool carsLoaded,
    @Default("") String email,
    @Default("") String password,
  }) = _MainState;

  factory MainState.fromJson(Map<String, dynamic> json) =>
      _$MainStateFromJson(json);
}
