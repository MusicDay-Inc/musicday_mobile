// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_container_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthContainerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() nonAuthorized,
    required TResult Function() inRegistration,
    required TResult Function() authorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? nonAuthorized,
    TResult? Function()? inRegistration,
    TResult? Function()? authorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? nonAuthorized,
    TResult Function()? inRegistration,
    TResult Function()? authorized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NonAuthorized value) nonAuthorized,
    required TResult Function(InRegistration value) inRegistration,
    required TResult Function(Authorized value) authorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NonAuthorized value)? nonAuthorized,
    TResult? Function(InRegistration value)? inRegistration,
    TResult? Function(Authorized value)? authorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NonAuthorized value)? nonAuthorized,
    TResult Function(InRegistration value)? inRegistration,
    TResult Function(Authorized value)? authorized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthContainerStateCopyWith<$Res> {
  factory $AuthContainerStateCopyWith(
          AuthContainerState value, $Res Function(AuthContainerState) then) =
      _$AuthContainerStateCopyWithImpl<$Res, AuthContainerState>;
}

/// @nodoc
class _$AuthContainerStateCopyWithImpl<$Res, $Val extends AuthContainerState>
    implements $AuthContainerStateCopyWith<$Res> {
  _$AuthContainerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NonAuthorizedCopyWith<$Res> {
  factory _$$NonAuthorizedCopyWith(
          _$NonAuthorized value, $Res Function(_$NonAuthorized) then) =
      __$$NonAuthorizedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NonAuthorizedCopyWithImpl<$Res>
    extends _$AuthContainerStateCopyWithImpl<$Res, _$NonAuthorized>
    implements _$$NonAuthorizedCopyWith<$Res> {
  __$$NonAuthorizedCopyWithImpl(
      _$NonAuthorized _value, $Res Function(_$NonAuthorized) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NonAuthorized implements NonAuthorized {
  const _$NonAuthorized();

  @override
  String toString() {
    return 'AuthContainerState.nonAuthorized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NonAuthorized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() nonAuthorized,
    required TResult Function() inRegistration,
    required TResult Function() authorized,
  }) {
    return nonAuthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? nonAuthorized,
    TResult? Function()? inRegistration,
    TResult? Function()? authorized,
  }) {
    return nonAuthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? nonAuthorized,
    TResult Function()? inRegistration,
    TResult Function()? authorized,
    required TResult orElse(),
  }) {
    if (nonAuthorized != null) {
      return nonAuthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NonAuthorized value) nonAuthorized,
    required TResult Function(InRegistration value) inRegistration,
    required TResult Function(Authorized value) authorized,
  }) {
    return nonAuthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NonAuthorized value)? nonAuthorized,
    TResult? Function(InRegistration value)? inRegistration,
    TResult? Function(Authorized value)? authorized,
  }) {
    return nonAuthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NonAuthorized value)? nonAuthorized,
    TResult Function(InRegistration value)? inRegistration,
    TResult Function(Authorized value)? authorized,
    required TResult orElse(),
  }) {
    if (nonAuthorized != null) {
      return nonAuthorized(this);
    }
    return orElse();
  }
}

abstract class NonAuthorized implements AuthContainerState {
  const factory NonAuthorized() = _$NonAuthorized;
}

/// @nodoc
abstract class _$$InRegistrationCopyWith<$Res> {
  factory _$$InRegistrationCopyWith(
          _$InRegistration value, $Res Function(_$InRegistration) then) =
      __$$InRegistrationCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InRegistrationCopyWithImpl<$Res>
    extends _$AuthContainerStateCopyWithImpl<$Res, _$InRegistration>
    implements _$$InRegistrationCopyWith<$Res> {
  __$$InRegistrationCopyWithImpl(
      _$InRegistration _value, $Res Function(_$InRegistration) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InRegistration implements InRegistration {
  const _$InRegistration();

  @override
  String toString() {
    return 'AuthContainerState.inRegistration()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InRegistration);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() nonAuthorized,
    required TResult Function() inRegistration,
    required TResult Function() authorized,
  }) {
    return inRegistration();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? nonAuthorized,
    TResult? Function()? inRegistration,
    TResult? Function()? authorized,
  }) {
    return inRegistration?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? nonAuthorized,
    TResult Function()? inRegistration,
    TResult Function()? authorized,
    required TResult orElse(),
  }) {
    if (inRegistration != null) {
      return inRegistration();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NonAuthorized value) nonAuthorized,
    required TResult Function(InRegistration value) inRegistration,
    required TResult Function(Authorized value) authorized,
  }) {
    return inRegistration(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NonAuthorized value)? nonAuthorized,
    TResult? Function(InRegistration value)? inRegistration,
    TResult? Function(Authorized value)? authorized,
  }) {
    return inRegistration?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NonAuthorized value)? nonAuthorized,
    TResult Function(InRegistration value)? inRegistration,
    TResult Function(Authorized value)? authorized,
    required TResult orElse(),
  }) {
    if (inRegistration != null) {
      return inRegistration(this);
    }
    return orElse();
  }
}

abstract class InRegistration implements AuthContainerState {
  const factory InRegistration() = _$InRegistration;
}

/// @nodoc
abstract class _$$AuthorizedCopyWith<$Res> {
  factory _$$AuthorizedCopyWith(
          _$Authorized value, $Res Function(_$Authorized) then) =
      __$$AuthorizedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AuthorizedCopyWithImpl<$Res>
    extends _$AuthContainerStateCopyWithImpl<$Res, _$Authorized>
    implements _$$AuthorizedCopyWith<$Res> {
  __$$AuthorizedCopyWithImpl(
      _$Authorized _value, $Res Function(_$Authorized) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Authorized implements Authorized {
  const _$Authorized();

  @override
  String toString() {
    return 'AuthContainerState.authorized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Authorized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() nonAuthorized,
    required TResult Function() inRegistration,
    required TResult Function() authorized,
  }) {
    return authorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? nonAuthorized,
    TResult? Function()? inRegistration,
    TResult? Function()? authorized,
  }) {
    return authorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? nonAuthorized,
    TResult Function()? inRegistration,
    TResult Function()? authorized,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NonAuthorized value) nonAuthorized,
    required TResult Function(InRegistration value) inRegistration,
    required TResult Function(Authorized value) authorized,
  }) {
    return authorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NonAuthorized value)? nonAuthorized,
    TResult? Function(InRegistration value)? inRegistration,
    TResult? Function(Authorized value)? authorized,
  }) {
    return authorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NonAuthorized value)? nonAuthorized,
    TResult Function(InRegistration value)? inRegistration,
    TResult Function(Authorized value)? authorized,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(this);
    }
    return orElse();
  }
}

abstract class Authorized implements AuthContainerState {
  const factory Authorized() = _$Authorized;
}
