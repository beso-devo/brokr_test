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
  bool get isLoadingCars => throw _privateConstructorUsedError;
  bool get errorLoadingCars => throw _privateConstructorUsedError;
  bool get carsLoaded => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

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
      {bool isLoadingCars,
      bool errorLoadingCars,
      bool carsLoaded,
      String email,
      String password});
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
    Object? isLoadingCars = null,
    Object? errorLoadingCars = null,
    Object? carsLoaded = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      isLoadingCars: null == isLoadingCars
          ? _value.isLoadingCars
          : isLoadingCars // ignore: cast_nullable_to_non_nullable
              as bool,
      errorLoadingCars: null == errorLoadingCars
          ? _value.errorLoadingCars
          : errorLoadingCars // ignore: cast_nullable_to_non_nullable
              as bool,
      carsLoaded: null == carsLoaded
          ? _value.carsLoaded
          : carsLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
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
      {bool isLoadingCars,
      bool errorLoadingCars,
      bool carsLoaded,
      String email,
      String password});
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
    Object? isLoadingCars = null,
    Object? errorLoadingCars = null,
    Object? carsLoaded = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$MainStateImpl(
      isLoadingCars: null == isLoadingCars
          ? _value.isLoadingCars
          : isLoadingCars // ignore: cast_nullable_to_non_nullable
              as bool,
      errorLoadingCars: null == errorLoadingCars
          ? _value.errorLoadingCars
          : errorLoadingCars // ignore: cast_nullable_to_non_nullable
              as bool,
      carsLoaded: null == carsLoaded
          ? _value.carsLoaded
          : carsLoaded // ignore: cast_nullable_to_non_nullable
              as bool,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MainStateImpl implements _MainState {
  const _$MainStateImpl(
      {this.isLoadingCars = false,
      this.errorLoadingCars = false,
      this.carsLoaded = false,
      this.email = "",
      this.password = ""});

  factory _$MainStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$MainStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isLoadingCars;
  @override
  @JsonKey()
  final bool errorLoadingCars;
  @override
  @JsonKey()
  final bool carsLoaded;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;

  @override
  String toString() {
    return 'MainState(isLoadingCars: $isLoadingCars, errorLoadingCars: $errorLoadingCars, carsLoaded: $carsLoaded, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainStateImpl &&
            (identical(other.isLoadingCars, isLoadingCars) ||
                other.isLoadingCars == isLoadingCars) &&
            (identical(other.errorLoadingCars, errorLoadingCars) ||
                other.errorLoadingCars == errorLoadingCars) &&
            (identical(other.carsLoaded, carsLoaded) ||
                other.carsLoaded == carsLoaded) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isLoadingCars, errorLoadingCars,
      carsLoaded, email, password);

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
      {final bool isLoadingCars,
      final bool errorLoadingCars,
      final bool carsLoaded,
      final String email,
      final String password}) = _$MainStateImpl;

  factory _MainState.fromJson(Map<String, dynamic> json) =
      _$MainStateImpl.fromJson;

  @override
  bool get isLoadingCars;
  @override
  bool get errorLoadingCars;
  @override
  bool get carsLoaded;
  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$MainStateImplCopyWith<_$MainStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
