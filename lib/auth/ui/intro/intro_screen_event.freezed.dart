// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'intro_screen_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IntroScreenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() googleButtonClick,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? googleButtonClick,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? googleButtonClick,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GoogleButtonClick value) googleButtonClick,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GoogleButtonClick value)? googleButtonClick,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GoogleButtonClick value)? googleButtonClick,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntroScreenEventCopyWith<$Res> {
  factory $IntroScreenEventCopyWith(
          IntroScreenEvent value, $Res Function(IntroScreenEvent) then) =
      _$IntroScreenEventCopyWithImpl<$Res, IntroScreenEvent>;
}

/// @nodoc
class _$IntroScreenEventCopyWithImpl<$Res, $Val extends IntroScreenEvent>
    implements $IntroScreenEventCopyWith<$Res> {
  _$IntroScreenEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GoogleButtonClickCopyWith<$Res> {
  factory _$$GoogleButtonClickCopyWith(
          _$GoogleButtonClick value, $Res Function(_$GoogleButtonClick) then) =
      __$$GoogleButtonClickCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GoogleButtonClickCopyWithImpl<$Res>
    extends _$IntroScreenEventCopyWithImpl<$Res, _$GoogleButtonClick>
    implements _$$GoogleButtonClickCopyWith<$Res> {
  __$$GoogleButtonClickCopyWithImpl(
      _$GoogleButtonClick _value, $Res Function(_$GoogleButtonClick) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GoogleButtonClick implements GoogleButtonClick {
  const _$GoogleButtonClick();

  @override
  String toString() {
    return 'IntroScreenEvent.googleButtonClick()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GoogleButtonClick);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() googleButtonClick,
  }) {
    return googleButtonClick();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? googleButtonClick,
  }) {
    return googleButtonClick?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? googleButtonClick,
    required TResult orElse(),
  }) {
    if (googleButtonClick != null) {
      return googleButtonClick();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GoogleButtonClick value) googleButtonClick,
  }) {
    return googleButtonClick(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GoogleButtonClick value)? googleButtonClick,
  }) {
    return googleButtonClick?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GoogleButtonClick value)? googleButtonClick,
    required TResult orElse(),
  }) {
    if (googleButtonClick != null) {
      return googleButtonClick(this);
    }
    return orElse();
  }
}

abstract class GoogleButtonClick implements IntroScreenEvent {
  const factory GoogleButtonClick() = _$GoogleButtonClick;
}
