// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_type_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeliveryTypeState {
  DeliveryType get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeliveryTypeStateCopyWith<DeliveryTypeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryTypeStateCopyWith<$Res> {
  factory $DeliveryTypeStateCopyWith(
          DeliveryTypeState value, $Res Function(DeliveryTypeState) then) =
      _$DeliveryTypeStateCopyWithImpl<$Res, DeliveryTypeState>;
  @useResult
  $Res call({DeliveryType type});
}

/// @nodoc
class _$DeliveryTypeStateCopyWithImpl<$Res, $Val extends DeliveryTypeState>
    implements $DeliveryTypeStateCopyWith<$Res> {
  _$DeliveryTypeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DeliveryType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeliveryTypeStateImplCopyWith<$Res>
    implements $DeliveryTypeStateCopyWith<$Res> {
  factory _$$DeliveryTypeStateImplCopyWith(_$DeliveryTypeStateImpl value,
          $Res Function(_$DeliveryTypeStateImpl) then) =
      __$$DeliveryTypeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DeliveryType type});
}

/// @nodoc
class __$$DeliveryTypeStateImplCopyWithImpl<$Res>
    extends _$DeliveryTypeStateCopyWithImpl<$Res, _$DeliveryTypeStateImpl>
    implements _$$DeliveryTypeStateImplCopyWith<$Res> {
  __$$DeliveryTypeStateImplCopyWithImpl(_$DeliveryTypeStateImpl _value,
      $Res Function(_$DeliveryTypeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$DeliveryTypeStateImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DeliveryType,
    ));
  }
}

/// @nodoc

class _$DeliveryTypeStateImpl extends _DeliveryTypeState {
  const _$DeliveryTypeStateImpl({this.type = DeliveryType.delivery})
      : super._();

  @override
  @JsonKey()
  final DeliveryType type;

  @override
  String toString() {
    return 'DeliveryTypeState(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryTypeStateImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryTypeStateImplCopyWith<_$DeliveryTypeStateImpl> get copyWith =>
      __$$DeliveryTypeStateImplCopyWithImpl<_$DeliveryTypeStateImpl>(
          this, _$identity);
}

abstract class _DeliveryTypeState extends DeliveryTypeState {
  const factory _DeliveryTypeState({final DeliveryType type}) =
      _$DeliveryTypeStateImpl;
  const _DeliveryTypeState._() : super._();

  @override
  DeliveryType get type;
  @override
  @JsonKey(ignore: true)
  _$$DeliveryTypeStateImplCopyWith<_$DeliveryTypeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
