import 'package:brokr/core/error/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/boat_entity.dart';

part 'main_state.freezed.dart';

part 'main_state.g.dart';

@freezed
abstract class MainState with _$MainState {
  const factory MainState({
    @Default(false) bool isLoadingBoats,
    @Default(false) bool errorLoadingBoats,
    @Default(false) bool boatsLoaded,
    @Default([]) List<BoatEntity> boats,
  }) = _MainState;

  factory MainState.fromJson(Map<String, dynamic> json) =>
      _$MainStateFromJson(json);
}
