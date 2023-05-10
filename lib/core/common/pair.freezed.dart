// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pair.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Pair<A, B> {
  A get first => throw _privateConstructorUsedError;
  B get second => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PairCopyWith<A, B, Pair<A, B>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PairCopyWith<A, B, $Res> {
  factory $PairCopyWith(Pair<A, B> value, $Res Function(Pair<A, B>) then) =
      _$PairCopyWithImpl<A, B, $Res, Pair<A, B>>;
  @useResult
  $Res call({A first, B second});
}

/// @nodoc
class _$PairCopyWithImpl<A, B, $Res, $Val extends Pair<A, B>>
    implements $PairCopyWith<A, B, $Res> {
  _$PairCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = freezed,
    Object? second = freezed,
  }) {
    return _then(_value.copyWith(
      first: freezed == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as A,
      second: freezed == second
          ? _value.second
          : second // ignore: cast_nullable_to_non_nullable
              as B,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PairCopyWith<A, B, $Res>
    implements $PairCopyWith<A, B, $Res> {
  factory _$$_PairCopyWith(
          _$_Pair<A, B> value, $Res Function(_$_Pair<A, B>) then) =
      __$$_PairCopyWithImpl<A, B, $Res>;
  @override
  @useResult
  $Res call({A first, B second});
}

/// @nodoc
class __$$_PairCopyWithImpl<A, B, $Res>
    extends _$PairCopyWithImpl<A, B, $Res, _$_Pair<A, B>>
    implements _$$_PairCopyWith<A, B, $Res> {
  __$$_PairCopyWithImpl(
      _$_Pair<A, B> _value, $Res Function(_$_Pair<A, B>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? first = freezed,
    Object? second = freezed,
  }) {
    return _then(_$_Pair<A, B>(
      first: freezed == first
          ? _value.first
          : first // ignore: cast_nullable_to_non_nullable
              as A,
      second: freezed == second
          ? _value.second
          : second // ignore: cast_nullable_to_non_nullable
              as B,
    ));
  }
}

/// @nodoc

class _$_Pair<A, B> implements _Pair<A, B> {
  const _$_Pair({required this.first, required this.second});

  @override
  final A first;
  @override
  final B second;

  @override
  String toString() {
    return 'Pair<$A, $B>(first: $first, second: $second)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Pair<A, B> &&
            const DeepCollectionEquality().equals(other.first, first) &&
            const DeepCollectionEquality().equals(other.second, second));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(first),
      const DeepCollectionEquality().hash(second));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PairCopyWith<A, B, _$_Pair<A, B>> get copyWith =>
      __$$_PairCopyWithImpl<A, B, _$_Pair<A, B>>(this, _$identity);
}

abstract class _Pair<A, B> implements Pair<A, B> {
  const factory _Pair({required final A first, required final B second}) =
      _$_Pair<A, B>;

  @override
  A get first;
  @override
  B get second;
  @override
  @JsonKey(ignore: true)
  _$$_PairCopyWith<A, B, _$_Pair<A, B>> get copyWith =>
      throw _privateConstructorUsedError;
}
