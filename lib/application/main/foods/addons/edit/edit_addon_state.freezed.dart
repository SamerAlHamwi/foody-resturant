// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_addon_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditAddonState {
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditAddonStateCopyWith<EditAddonState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditAddonStateCopyWith<$Res> {
  factory $EditAddonStateCopyWith(
          EditAddonState value, $Res Function(EditAddonState) then) =
      _$EditAddonStateCopyWithImpl<$Res, EditAddonState>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$EditAddonStateCopyWithImpl<$Res, $Val extends EditAddonState>
    implements $EditAddonStateCopyWith<$Res> {
  _$EditAddonStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditAddonStateImplCopyWith<$Res>
    implements $EditAddonStateCopyWith<$Res> {
  factory _$$EditAddonStateImplCopyWith(_$EditAddonStateImpl value,
          $Res Function(_$EditAddonStateImpl) then) =
      __$$EditAddonStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$EditAddonStateImplCopyWithImpl<$Res>
    extends _$EditAddonStateCopyWithImpl<$Res, _$EditAddonStateImpl>
    implements _$$EditAddonStateImplCopyWith<$Res> {
  __$$EditAddonStateImplCopyWithImpl(
      _$EditAddonStateImpl _value, $Res Function(_$EditAddonStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$EditAddonStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$EditAddonStateImpl extends _EditAddonState {
  const _$EditAddonStateImpl({this.isLoading = false}) : super._();

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'EditAddonState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditAddonStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditAddonStateImplCopyWith<_$EditAddonStateImpl> get copyWith =>
      __$$EditAddonStateImplCopyWithImpl<_$EditAddonStateImpl>(
          this, _$identity);
}

abstract class _EditAddonState extends EditAddonState {
  const factory _EditAddonState({final bool isLoading}) = _$EditAddonStateImpl;
  const _EditAddonState._() : super._();

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$EditAddonStateImplCopyWith<_$EditAddonStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
