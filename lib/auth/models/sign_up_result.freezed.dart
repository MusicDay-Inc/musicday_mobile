// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignUpResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isNicknameInvalid, bool isUsernameInvalid)
        invalidFormat,
    required TResult Function() serverError,
    required TResult Function() success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isNicknameInvalid, bool isUsernameInvalid)?
        invalidFormat,
    TResult? Function()? serverError,
    TResult? Function()? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isNicknameInvalid, bool isUsernameInvalid)?
        invalidFormat,
    TResult Function()? serverError,
    TResult Function()? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidFormat value) invalidFormat,
    required TResult Function(ServerError value) serverError,
    required TResult Function(Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidFormat value)? invalidFormat,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(Success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidFormat value)? invalidFormat,
    TResult Function(ServerError value)? serverError,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpResultCopyWith<$Res> {
  factory $SignUpResultCopyWith(
          SignUpResult value, $Res Function(SignUpResult) then) =
      _$SignUpResultCopyWithImpl<$Res, SignUpResult>;
}

/// @nodoc
class _$SignUpResultCopyWithImpl<$Res, $Val extends SignUpResult>
    implements $SignUpResultCopyWith<$Res> {
  _$SignUpResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
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
    extends _$SignUpResultCopyWithImpl<$Res, _$InvalidFormat>
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
    return 'SignUpResult.invalidFormat(isNicknameInvalid: $isNicknameInvalid, isUsernameInvalid: $isUsernameInvalid)';
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
    required TResult Function(bool isNicknameInvalid, bool isUsernameInvalid)
        invalidFormat,
    required TResult Function() serverError,
    required TResult Function() success,
  }) {
    return invalidFormat(isNicknameInvalid, isUsernameInvalid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isNicknameInvalid, bool isUsernameInvalid)?
        invalidFormat,
    TResult? Function()? serverError,
    TResult? Function()? success,
  }) {
    return invalidFormat?.call(isNicknameInvalid, isUsernameInvalid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isNicknameInvalid, bool isUsernameInvalid)?
        invalidFormat,
    TResult Function()? serverError,
    TResult Function()? success,
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
    required TResult Function(InvalidFormat value) invalidFormat,
    required TResult Function(ServerError value) serverError,
    required TResult Function(Success value) success,
  }) {
    return invalidFormat(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidFormat value)? invalidFormat,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(Success value)? success,
  }) {
    return invalidFormat?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidFormat value)? invalidFormat,
    TResult Function(ServerError value)? serverError,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (invalidFormat != null) {
      return invalidFormat(this);
    }
    return orElse();
  }
}

abstract class InvalidFormat implements SignUpResult {
  const factory InvalidFormat(
          final bool isNicknameInvalid, final bool isUsernameInvalid) =
      _$InvalidFormat;

  bool get isNicknameInvalid;
  bool get isUsernameInvalid;
  @JsonKey(ignore: true)
  _$$InvalidFormatCopyWith<_$InvalidFormat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServerErrorCopyWith<$Res> {
  factory _$$ServerErrorCopyWith(
          _$ServerError value, $Res Function(_$ServerError) then) =
      __$$ServerErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ServerErrorCopyWithImpl<$Res>
    extends _$SignUpResultCopyWithImpl<$Res, _$ServerError>
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
    return 'SignUpResult.serverError()';
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
    required TResult Function(bool isNicknameInvalid, bool isUsernameInvalid)
        invalidFormat,
    required TResult Function() serverError,
    required TResult Function() success,
  }) {
    return serverError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isNicknameInvalid, bool isUsernameInvalid)?
        invalidFormat,
    TResult? Function()? serverError,
    TResult? Function()? success,
  }) {
    return serverError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isNicknameInvalid, bool isUsernameInvalid)?
        invalidFormat,
    TResult Function()? serverError,
    TResult Function()? success,
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
    required TResult Function(InvalidFormat value) invalidFormat,
    required TResult Function(ServerError value) serverError,
    required TResult Function(Success value) success,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidFormat value)? invalidFormat,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(Success value)? success,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidFormat value)? invalidFormat,
    TResult Function(ServerError value)? serverError,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerError implements SignUpResult {
  const factory ServerError() = _$ServerError;
}

/// @nodoc
abstract class _$$SuccessCopyWith<$Res> {
  factory _$$SuccessCopyWith(_$Success value, $Res Function(_$Success) then) =
      __$$SuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessCopyWithImpl<$Res>
    extends _$SignUpResultCopyWithImpl<$Res, _$Success>
    implements _$$SuccessCopyWith<$Res> {
  __$$SuccessCopyWithImpl(_$Success _value, $Res Function(_$Success) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Success implements Success {
  const _$Success();

  @override
  String toString() {
    return 'SignUpResult.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Success);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isNicknameInvalid, bool isUsernameInvalid)
        invalidFormat,
    required TResult Function() serverError,
    required TResult Function() success,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isNicknameInvalid, bool isUsernameInvalid)?
        invalidFormat,
    TResult? Function()? serverError,
    TResult? Function()? success,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isNicknameInvalid, bool isUsernameInvalid)?
        invalidFormat,
    TResult Function()? serverError,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidFormat value) invalidFormat,
    required TResult Function(ServerError value) serverError,
    required TResult Function(Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidFormat value)? invalidFormat,
    TResult? Function(ServerError value)? serverError,
    TResult? Function(Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidFormat value)? invalidFormat,
    TResult Function(ServerError value)? serverError,
    TResult Function(Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements SignUpResult {
  const factory Success() = _$Success;
}
