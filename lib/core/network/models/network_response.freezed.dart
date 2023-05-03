// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NetworkResponse<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int code) serverError,
    required TResult Function() serverNotAvailable,
    required TResult Function(T data) ok,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int code)? serverError,
    TResult? Function()? serverNotAvailable,
    TResult? Function(T data)? ok,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int code)? serverError,
    TResult Function()? serverNotAvailable,
    TResult Function(T data)? ok,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError<T> value) serverError,
    required TResult Function(ServerNotAvailable<T> value) serverNotAvailable,
    required TResult Function(Ok<T> value) ok,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError<T> value)? serverError,
    TResult? Function(ServerNotAvailable<T> value)? serverNotAvailable,
    TResult? Function(Ok<T> value)? ok,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError<T> value)? serverError,
    TResult Function(ServerNotAvailable<T> value)? serverNotAvailable,
    TResult Function(Ok<T> value)? ok,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkResponseCopyWith<T, $Res> {
  factory $NetworkResponseCopyWith(
          NetworkResponse<T> value, $Res Function(NetworkResponse<T>) then) =
      _$NetworkResponseCopyWithImpl<T, $Res, NetworkResponse<T>>;
}

/// @nodoc
class _$NetworkResponseCopyWithImpl<T, $Res, $Val extends NetworkResponse<T>>
    implements $NetworkResponseCopyWith<T, $Res> {
  _$NetworkResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ServerErrorCopyWith<T, $Res> {
  factory _$$ServerErrorCopyWith(
          _$ServerError<T> value, $Res Function(_$ServerError<T>) then) =
      __$$ServerErrorCopyWithImpl<T, $Res>;
  @useResult
  $Res call({int code});
}

/// @nodoc
class __$$ServerErrorCopyWithImpl<T, $Res>
    extends _$NetworkResponseCopyWithImpl<T, $Res, _$ServerError<T>>
    implements _$$ServerErrorCopyWith<T, $Res> {
  __$$ServerErrorCopyWithImpl(
      _$ServerError<T> _value, $Res Function(_$ServerError<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_$ServerError<T>(
      null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ServerError<T> implements ServerError<T> {
  const _$ServerError(this.code);

  @override
  final int code;

  @override
  String toString() {
    return 'NetworkResponse<$T>.serverError(code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerError<T> &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerErrorCopyWith<T, _$ServerError<T>> get copyWith =>
      __$$ServerErrorCopyWithImpl<T, _$ServerError<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int code) serverError,
    required TResult Function() serverNotAvailable,
    required TResult Function(T data) ok,
  }) {
    return serverError(code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int code)? serverError,
    TResult? Function()? serverNotAvailable,
    TResult? Function(T data)? ok,
  }) {
    return serverError?.call(code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int code)? serverError,
    TResult Function()? serverNotAvailable,
    TResult Function(T data)? ok,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError<T> value) serverError,
    required TResult Function(ServerNotAvailable<T> value) serverNotAvailable,
    required TResult Function(Ok<T> value) ok,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError<T> value)? serverError,
    TResult? Function(ServerNotAvailable<T> value)? serverNotAvailable,
    TResult? Function(Ok<T> value)? ok,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError<T> value)? serverError,
    TResult Function(ServerNotAvailable<T> value)? serverNotAvailable,
    TResult Function(Ok<T> value)? ok,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerError<T> implements NetworkResponse<T> {
  const factory ServerError(final int code) = _$ServerError<T>;

  int get code;
  @JsonKey(ignore: true)
  _$$ServerErrorCopyWith<T, _$ServerError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ServerNotAvailableCopyWith<T, $Res> {
  factory _$$ServerNotAvailableCopyWith(_$ServerNotAvailable<T> value,
          $Res Function(_$ServerNotAvailable<T>) then) =
      __$$ServerNotAvailableCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$ServerNotAvailableCopyWithImpl<T, $Res>
    extends _$NetworkResponseCopyWithImpl<T, $Res, _$ServerNotAvailable<T>>
    implements _$$ServerNotAvailableCopyWith<T, $Res> {
  __$$ServerNotAvailableCopyWithImpl(_$ServerNotAvailable<T> _value,
      $Res Function(_$ServerNotAvailable<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ServerNotAvailable<T> implements ServerNotAvailable<T> {
  const _$ServerNotAvailable();

  @override
  String toString() {
    return 'NetworkResponse<$T>.serverNotAvailable()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ServerNotAvailable<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int code) serverError,
    required TResult Function() serverNotAvailable,
    required TResult Function(T data) ok,
  }) {
    return serverNotAvailable();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int code)? serverError,
    TResult? Function()? serverNotAvailable,
    TResult? Function(T data)? ok,
  }) {
    return serverNotAvailable?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int code)? serverError,
    TResult Function()? serverNotAvailable,
    TResult Function(T data)? ok,
    required TResult orElse(),
  }) {
    if (serverNotAvailable != null) {
      return serverNotAvailable();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError<T> value) serverError,
    required TResult Function(ServerNotAvailable<T> value) serverNotAvailable,
    required TResult Function(Ok<T> value) ok,
  }) {
    return serverNotAvailable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError<T> value)? serverError,
    TResult? Function(ServerNotAvailable<T> value)? serverNotAvailable,
    TResult? Function(Ok<T> value)? ok,
  }) {
    return serverNotAvailable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError<T> value)? serverError,
    TResult Function(ServerNotAvailable<T> value)? serverNotAvailable,
    TResult Function(Ok<T> value)? ok,
    required TResult orElse(),
  }) {
    if (serverNotAvailable != null) {
      return serverNotAvailable(this);
    }
    return orElse();
  }
}

abstract class ServerNotAvailable<T> implements NetworkResponse<T> {
  const factory ServerNotAvailable() = _$ServerNotAvailable<T>;
}

/// @nodoc
abstract class _$$OkCopyWith<T, $Res> {
  factory _$$OkCopyWith(_$Ok<T> value, $Res Function(_$Ok<T>) then) =
      __$$OkCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$OkCopyWithImpl<T, $Res>
    extends _$NetworkResponseCopyWithImpl<T, $Res, _$Ok<T>>
    implements _$$OkCopyWith<T, $Res> {
  __$$OkCopyWithImpl(_$Ok<T> _value, $Res Function(_$Ok<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$Ok<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$Ok<T> implements Ok<T> {
  const _$Ok(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'NetworkResponse<$T>.ok(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Ok<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OkCopyWith<T, _$Ok<T>> get copyWith =>
      __$$OkCopyWithImpl<T, _$Ok<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int code) serverError,
    required TResult Function() serverNotAvailable,
    required TResult Function(T data) ok,
  }) {
    return ok(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int code)? serverError,
    TResult? Function()? serverNotAvailable,
    TResult? Function(T data)? ok,
  }) {
    return ok?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int code)? serverError,
    TResult Function()? serverNotAvailable,
    TResult Function(T data)? ok,
    required TResult orElse(),
  }) {
    if (ok != null) {
      return ok(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError<T> value) serverError,
    required TResult Function(ServerNotAvailable<T> value) serverNotAvailable,
    required TResult Function(Ok<T> value) ok,
  }) {
    return ok(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError<T> value)? serverError,
    TResult? Function(ServerNotAvailable<T> value)? serverNotAvailable,
    TResult? Function(Ok<T> value)? ok,
  }) {
    return ok?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError<T> value)? serverError,
    TResult Function(ServerNotAvailable<T> value)? serverNotAvailable,
    TResult Function(Ok<T> value)? ok,
    required TResult orElse(),
  }) {
    if (ok != null) {
      return ok(this);
    }
    return orElse();
  }
}

abstract class Ok<T> implements NetworkResponse<T> {
  const factory Ok(final T data) = _$Ok<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$OkCopyWith<T, _$Ok<T>> get copyWith => throw _privateConstructorUsedError;
}
