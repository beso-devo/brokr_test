// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MainState _$MainStateFromJson(Map<String, dynamic> json) {
  return _MainState.fromJson(json);
}

/// @nodoc
mixin _$MainState {
  bool get isLoadingBoats => throw _privateConstructorUsedError;
  bool get errorLoadingBoats => throw _privateConstructorUsedError;
  bool get boatsLoaded => throw _privateConstructorUsedError;
  List<BoatEntity> get boats => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MainStateCopyWith<MainState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainStateCopyWith<$Res> {
  factory $MainStateCopyWith(MainState value, $Res Function(MainState) then) =
      _$MainStateCopyWithImpl<$Res, MainState>;
  @useResult
  $Res call(
      {bool isLoadingBoats,
      bool errorLoadingBoats,
      bool boatsLoaded,
      List<BoatEntity> boats});
}

/// @nodoc
class _$MainStateCopyWithImpl<$Res, $Val extends MainState>
    implements $MainStateCopyWith<$Res> {
  _$MainStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingBoats = null,
    Object? errorLoadingBoats = null,
    Object? boatsLoaded = null,
    Object? boats = null,
  }) {
    return _then(_value.copyWith(
      isLoadingBoats: null == isLoadingBoats
          ? _value.isLoadingBoats
          : isLoadingBoats // ignore: cast_nullable_to_non_nullable
              as bool,
      errorLoadingBoats: null == errorLoadingBoats
          ? _value.errorLoadingBoats
          : errorLoadingBoats // ignore: cast_nullable_to_non_nullable
              as bool,
      boatsLoaded: null == boatsLoaded
          ? _value.boatsLoaded
          : boatsLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
      boats: null == boats
          ? _value.boats
          : boats // ignore: cast_nullable_to_non_nullable
              as List<BoatEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MainStateImplCopyWith<$Res>
    implements $MainStateCopyWith<$Res> {
  factory _$$MainStateImplCopyWith(
          _$MainStateImpl value, $Res Function(_$MainStateImpl) then) =
      __$$MainStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoadingBoats,
      bool errorLoadingBoats,
      bool boatsLoaded,
      List<BoatEntity> boats});
}

/// @nodoc
class __$$MainStateImplCopyWithImpl<$Res>
    extends _$MainStateCopyWithImpl<$Res, _$MainStateImpl>
    implements _$$MainStateImplCopyWith<$Res> {
  __$$MainStateImplCopyWithImpl(
      _$MainStateImpl _value, $Res Function(_$MainStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingBoats = null,
    Object? errorLoadingBoats = null,
    Object? boatsLoaded = null,
    Object? boats = null,
  }) {
    return _then(_$MainStateImpl(
      isLoadingBoats: null == isLoadingBoats
          ? _value.isLoadingBoats
          : isLoadingBoats // ignore: cast_nullable_to_non_nullable
              as bool,
      errorLoadingBoats: null == errorLoadingBoats
          ? _value.errorLoadingBoats
          : errorLoadingBoats // ignore: cast_nullable_to_non_nullable
              as bool,
      boatsLoaded: null == boatsLoaded
          ? _value.boatsLoaded
          : boatsLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
      boats: null == boats
          ? _value._boats
          : boats // ignore: cast_nullable_to_non_nullable
              as List<BoatEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MainStateImpl implements _MainState {
  const _$MainStateImpl(
      {this.isLoadingBoats = false,
      this.errorLoadingBoats = false,
      this.boatsLoaded = false,
      final List<BoatEntity> boats = const []})
      : _boats = boats;

  factory _$MainStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$MainStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isLoadingBoats;
  @override
  @JsonKey()
  final bool errorLoadingBoats;
  @override
  @JsonKey()
  final bool boatsLoaded;
  final List<BoatEntity> _boats;
  @override
  @JsonKey()
  List<BoatEntity> get boats {
    if (_boats is EqualUnmodifiableListView) return _boats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_boats);
  }

  @override
  String toString() {
    return 'MainState(isLoadingBoats: $isLoadingBoats, errorLoadingBoats: $errorLoadingBoats, boatsLoaded: $boatsLoaded, boats: $boats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainStateImpl &&
            (identical(other.isLoadingBoats, isLoadingBoats) ||
                other.isLoadingBoats == isLoadingBoats) &&
            (identical(other.errorLoadingBoats, errorLoadingBoats) ||
                other.errorLoadingBoats == errorLoadingBoats) &&
            (identical(other.boatsLoaded, boatsLoaded) ||
                other.boatsLoaded == boatsLoaded) &&
            const DeepCollectionEquality().equals(other._boats, _boats));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoadingBoats,
      errorLoadingBoats,
      boatsLoaded,
      const DeepCollectionEquality().hash(_boats));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainStateImplCopyWith<_$MainStateImpl> get copyWith =>
      __$$MainStateImplCopyWithImpl<_$MainStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MainStateImplToJson(
      this,
    );
  }
}

abstract class _MainState implements MainState {
  const factory _MainState(
      {final bool isLoadingBoats,
      final bool errorLoadingBoats,
      final bool boatsLoaded,
      final List<BoatEntity> boats}) = _$MainStateImpl;

  factory _MainState.fromJson(Map<String, dynamic> json) =
      _$MainStateImpl.fromJson;

  @override
  bool get isLoadingBoats;
  @override
  bool get errorLoadingBoats;
  @override
  bool get boatsLoaded;
  @override
  List<BoatEntity> get boats;
  @override
  @JsonKey(ignore: true)
  _$$MainStateImplCopyWith<_$MainStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
