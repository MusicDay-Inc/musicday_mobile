// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignUpScreenState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() serverError,
    required TResult Function(bool isNicknameInvalid, bool isUsernameInvalid)
        invalidFormat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function()? serverError,
    TResult? Function(bool isNicknameInvalid, bool isUsernameInvalid)?
        invalidFormat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? serverError,
    TResult Function(bool isNicknameInvalid, bool isUsernameInvalid)?
        invalidFormat,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(ServerError value) serverError,
    required TResult Function(InvalidFormat value) invalidFormat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Loading value)? loading,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(InvalidFormat value)? invalidFormat,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(ServerError value)? serverError,
    TResult Function(InvalidFormat value)? invalidFormat,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpScreenStateCopyWith<$Res> {
  factory $SignUpScreenStateCopyWith(
          SignUpScreenState value, $Res Function(SignUpScreenState) then) =
      _$SignUpScreenStateCopyWithImpl<$Res, SignUpScreenState>;
}

/// @nodoc
class _$SignUpScreenStateCopyWithImpl<$Res, $Val extends SignUpScreenState>
    implements $SignUpScreenStateCopyWith<$Res> {
  _$SignUpScreenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$IdleCopyWith<$Res> {
  factory _$$IdleCopyWith(_$Idle value, $Res Function(_$Idle) then) =
      __$$IdleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IdleCopyWithImpl<$Res>
    extends _$SignUpScreenStateCopyWithImpl<$Res, _$Idle>
    implements _$$IdleCopyWith<$Res> {
  __$$IdleCopyWithImpl(_$Idle _value, $Res Function(_$Idle) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Idle implements Idle {
  const _$Idle();

  @override
  String toString() {
    return 'SignUpScreenState.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Idle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() serverError,
    required TResult Function(bool isNicknameInvalid, bool isUsernameInvalid)
        invalidFormat,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function()? serverError,
    TResult? Function(bool isNicknameInvalid, bool isUsernameInvalid)?
        invalidFormat,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? serverError,
    TResult Function(bool isNicknameInvalid, bool isUsernameInvalid)?
        invalidFormat,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(ServerError value) serverError,
    required TResult Function(InvalidFormat value) invalidFormat,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Loading value)? loading,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(InvalidFormat value)? invalidFormat,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(ServerError value)? serverError,
    TResult Function(InvalidFormat value)? invalidFormat,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle implements SignUpScreenState {
  const factory Idle() = _$Idle;
}

/// @nodoc
abstract class _$$LoadingCopyWith<$Res> {
  factory _$$LoadingCopyWith(_$Loading value, $Res Function(_$Loading) then) =
      __$$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingCopyWithImpl<$Res>
    extends _$SignUpScreenStateCopyWithImpl<$Res, _$Loading>
    implements _$$LoadingCopyWith<$Res> {
  __$$LoadingCopyWithImpl(_$Loading _value, $Res Function(_$Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'SignUpScreenState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() serverError,
    required TResult Function(bool isNicknameInvalid, bool isUsernameInvalid)
        invalidFormat,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function()? serverError,
    TResult? Function(bool isNicknameInvalid, bool isUsernameInvalid)?
        invalidFormat,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? serverError,
    TResult Function(bool isNicknameInvalid, bool isUsernameInvalid)?
        invalidFormat,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(ServerError value) serverError,
    required TResult Function(InvalidFormat value) invalidFormat,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Loading value)? loading,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(InvalidFormat value)? invalidFormat,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(ServerError value)? serverError,
    TResult Function(InvalidFormat value)? invalidFormat,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements SignUpScreenState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class _$$ServerErrorCopyWith<$Res> {
  factory _$$ServerErrorCopyWith(
          _$ServerError value, $Res Function(_$ServerError) then) =
      __$$ServerErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServerErrorCopyWithImpl<$Res>
    extends _$SignUpScreenStateCopyWithImpl<$Res, _$ServerError>
    implements _$$ServerErrorCopyWith<$Res> {
  __$$ServerErrorCopyWithImpl(
      _$ServerError _value, $Res Function(_$ServerError) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ServerError implements ServerError {
  const _$ServerError();

  @override
  String toString() {
    return 'SignUpScreenState.serverError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ServerError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() serverError,
    required TResult Function(bool isNicknameInvalid, bool isUsernameInvalid)
        invalidFormat,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function()? serverError,
    TResult? Function(bool isNicknameInvalid, bool isUsernameInvalid)?
        invalidFormat,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? serverError,
    TResult Function(bool isNicknameInvalid, bool isUsernameInvalid)?
        invalidFormat,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(ServerError value) serverError,
    required TResult Function(InvalidFormat value) invalidFormat,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Loading value)? loading,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(InvalidFormat value)? invalidFormat,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(ServerError value)? serverError,
    TResult Function(InvalidFormat value)? invalidFormat,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerError implements SignUpScreenState {
  const factory ServerError() = _$ServerError;
}

/// @nodoc
abstract class _$$InvalidFormatCopyWith<$Res> {
  factory _$$InvalidFormatCopyWith(
          _$InvalidFormat value, $Res Function(_$InvalidFormat) then) =
      __$$InvalidFormatCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isNicknameInvalid, bool isUsernameInvalid});
}

/// @nodoc
class __$$InvalidFormatCopyWithImpl<$Res>
    extends _$SignUpScreenStateCopyWithImpl<$Res, _$InvalidFormat>
    implements _$$InvalidFormatCopyWith<$Res> {
  __$$InvalidFormatCopyWithImpl(
      _$InvalidFormat _value, $Res Function(_$InvalidFormat) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNicknameInvalid = null,
    Object? isUsernameInvalid = null,
  }) {
    return _then(_$InvalidFormat(
      null == isNicknameInvalid
          ? _value.isNicknameInvalid
          : isNicknameInvalid // ignore: cast_nullable_to_non_nullable
              as bool,
      null == isUsernameInvalid
          ? _value.isUsernameInvalid
          : isUsernameInvalid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InvalidFormat implements InvalidFormat {
  const _$InvalidFormat(this.isNicknameInvalid, this.isUsernameInvalid);

  @override
  final bool isNicknameInvalid;
  @override
  final bool isUsernameInvalid;

  @override
  String toString() {
    return 'SignUpScreenState.invalidFormat(isNicknameInvalid: $isNicknameInvalid, isUsernameInvalid: $isUsernameInvalid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidFormat &&
            (identical(other.isNicknameInvalid, isNicknameInvalid) ||
                other.isNicknameInvalid == isNicknameInvalid) &&
            (identical(other.isUsernameInvalid, isUsernameInvalid) ||
                other.isUsernameInvalid == isUsernameInvalid));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isNicknameInvalid, isUsernameInvalid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidFormatCopyWith<_$InvalidFormat> get copyWith =>
      __$$InvalidFormatCopyWithImpl<_$InvalidFormat>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() loading,
    required TResult Function() serverError,
    required TResult Function(bool isNicknameInvalid, bool isUsernameInvalid)
        invalidFormat,
  }) {
    return invalidFormat(isNicknameInvalid, isUsernameInvalid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? loading,
    TResult? Function()? serverError,
    TResult? Function(bool isNicknameInvalid, bool isUsernameInvalid)?
        invalidFormat,
  }) {
    return invalidFormat?.call(isNicknameInvalid, isUsernameInvalid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? loading,
    TResult Function()? serverError,
    TResult Function(bool isNicknameInvalid, bool isUsernameInvalid)?
        invalidFormat,
    required TResult orElse(),
  }) {
    if (invalidFormat != null) {
      return invalidFormat(isNicknameInvalid, isUsernameInvalid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle value) idle,
    required TResult Function(Loading value) loading,
    required TResult Function(ServerError value) serverError,
    required TResult Function(InvalidFormat value) invalidFormat,
  }) {
    return invalidFormat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle value)? idle,
    TResult? Function(Loading value)? loading,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(InvalidFormat value)? invalidFormat,
  }) {
    return invalidFormat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle value)? idle,
    TResult Function(Loading value)? loading,
    TResult Function(ServerError value)? serverError,
    TResult Function(InvalidFormat value)? invalidFormat,
    required TResult orElse(),
  }) {
    if (invalidFormat != null) {
      return invalidFormat(this);
    }
    return orElse();
  }
}

abstract class InvalidFormat implements SignUpScreenState {
  const factory InvalidFormat(
          final bool isNicknameInvalid, final bool isUsernameInvalid) =
      _$InvalidFormat;

  bool get isNicknameInvalid;
  bool get isUsernameInvalid;
  @JsonKey(ignore: true)
  _$$InvalidFormatCopyWith<_$InvalidFormat> get copyWith =>
      throw _privateConstructorUsedError;
}
