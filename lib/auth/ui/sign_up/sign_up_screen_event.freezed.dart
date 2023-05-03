// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_screen_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignUpScreenEvent {
  String get nickname => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String nickname, String username) doneClick,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String nickname, String username)? doneClick,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String nickname, String username)? doneClick,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DoneClick value) doneClick,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DoneClick value)? doneClick,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DoneClick value)? doneClick,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpScreenEventCopyWith<SignUpScreenEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpScreenEventCopyWith<$Res> {
  factory $SignUpScreenEventCopyWith(
          SignUpScreenEvent value, $Res Function(SignUpScreenEvent) then) =
      _$SignUpScreenEventCopyWithImpl<$Res, SignUpScreenEvent>;
  @useResult
  $Res call({String nickname, String username});
}

/// @nodoc
class _$SignUpScreenEventCopyWithImpl<$Res, $Val extends SignUpScreenEvent>
    implements $SignUpScreenEventCopyWith<$Res> {
  _$SignUpScreenEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? username = null,
  }) {
    return _then(_value.copyWith(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DoneClickCopyWith<$Res>
    implements $SignUpScreenEventCopyWith<$Res> {
  factory _$$DoneClickCopyWith(
          _$DoneClick value, $Res Function(_$DoneClick) then) =
      __$$DoneClickCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String nickname, String username});
}

/// @nodoc
class __$$DoneClickCopyWithImpl<$Res>
    extends _$SignUpScreenEventCopyWithImpl<$Res, _$DoneClick>
    implements _$$DoneClickCopyWith<$Res> {
  __$$DoneClickCopyWithImpl(
      _$DoneClick _value, $Res Function(_$DoneClick) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? username = null,
  }) {
    return _then(_$DoneClick(
      null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DoneClick implements DoneClick {
  const _$DoneClick(this.nickname, this.username);

  @override
  final String nickname;
  @override
  final String username;

  @override
  String toString() {
    return 'SignUpScreenEvent.doneClick(nickname: $nickname, username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DoneClick &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nickname, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DoneClickCopyWith<_$DoneClick> get copyWith =>
      __$$DoneClickCopyWithImpl<_$DoneClick>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String nickname, String username) doneClick,
  }) {
    return doneClick(nickname, username);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String nickname, String username)? doneClick,
  }) {
    return doneClick?.call(nickname, username);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String nickname, String username)? doneClick,
    required TResult orElse(),
  }) {
    if (doneClick != null) {
      return doneClick(nickname, username);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DoneClick value) doneClick,
  }) {
    return doneClick(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DoneClick value)? doneClick,
  }) {
    return doneClick?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DoneClick value)? doneClick,
    required TResult orElse(),
  }) {
    if (doneClick != null) {
      return doneClick(this);
    }
    return orElse();
  }
}

abstract class DoneClick implements SignUpScreenEvent {
  const factory DoneClick(final String nickname, final String username) =
      _$DoneClick;

  @override
  String get nickname;
  @override
  String get username;
  @override
  @JsonKey(ignore: true)
  _$$DoneClickCopyWith<_$DoneClick> get copyWith =>
      throw _privateConstructorUsedError;
}
