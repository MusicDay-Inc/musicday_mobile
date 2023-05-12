// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_info_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfileInfoEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() subscribe,
    required TResult Function() unsubscribe,
    required TResult Function() loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? subscribe,
    TResult? Function()? unsubscribe,
    TResult? Function()? loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? subscribe,
    TResult Function()? unsubscribe,
    TResult Function()? loadMore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Subscribe value) subscribe,
    required TResult Function(Unsubscribe value) unsubscribe,
    required TResult Function(LoadMore value) loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Subscribe value)? subscribe,
    TResult? Function(Unsubscribe value)? unsubscribe,
    TResult? Function(LoadMore value)? loadMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Subscribe value)? subscribe,
    TResult Function(Unsubscribe value)? unsubscribe,
    TResult Function(LoadMore value)? loadMore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileInfoEventCopyWith<$Res> {
  factory $ProfileInfoEventCopyWith(
          ProfileInfoEvent value, $Res Function(ProfileInfoEvent) then) =
      _$ProfileInfoEventCopyWithImpl<$Res, ProfileInfoEvent>;
}

/// @nodoc
class _$ProfileInfoEventCopyWithImpl<$Res, $Val extends ProfileInfoEvent>
    implements $ProfileInfoEventCopyWith<$Res> {
  _$ProfileInfoEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SubscribeCopyWith<$Res> {
  factory _$$SubscribeCopyWith(
          _$Subscribe value, $Res Function(_$Subscribe) then) =
      __$$SubscribeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SubscribeCopyWithImpl<$Res>
    extends _$ProfileInfoEventCopyWithImpl<$Res, _$Subscribe>
    implements _$$SubscribeCopyWith<$Res> {
  __$$SubscribeCopyWithImpl(
      _$Subscribe _value, $Res Function(_$Subscribe) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Subscribe implements Subscribe {
  const _$Subscribe();

  @override
  String toString() {
    return 'ProfileInfoEvent.subscribe()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Subscribe);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() subscribe,
    required TResult Function() unsubscribe,
    required TResult Function() loadMore,
  }) {
    return subscribe();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? subscribe,
    TResult? Function()? unsubscribe,
    TResult? Function()? loadMore,
  }) {
    return subscribe?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? subscribe,
    TResult Function()? unsubscribe,
    TResult Function()? loadMore,
    required TResult orElse(),
  }) {
    if (subscribe != null) {
      return subscribe();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Subscribe value) subscribe,
    required TResult Function(Unsubscribe value) unsubscribe,
    required TResult Function(LoadMore value) loadMore,
  }) {
    return subscribe(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Subscribe value)? subscribe,
    TResult? Function(Unsubscribe value)? unsubscribe,
    TResult? Function(LoadMore value)? loadMore,
  }) {
    return subscribe?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Subscribe value)? subscribe,
    TResult Function(Unsubscribe value)? unsubscribe,
    TResult Function(LoadMore value)? loadMore,
    required TResult orElse(),
  }) {
    if (subscribe != null) {
      return subscribe(this);
    }
    return orElse();
  }
}

abstract class Subscribe implements ProfileInfoEvent {
  const factory Subscribe() = _$Subscribe;
}

/// @nodoc
abstract class _$$UnsubscribeCopyWith<$Res> {
  factory _$$UnsubscribeCopyWith(
          _$Unsubscribe value, $Res Function(_$Unsubscribe) then) =
      __$$UnsubscribeCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnsubscribeCopyWithImpl<$Res>
    extends _$ProfileInfoEventCopyWithImpl<$Res, _$Unsubscribe>
    implements _$$UnsubscribeCopyWith<$Res> {
  __$$UnsubscribeCopyWithImpl(
      _$Unsubscribe _value, $Res Function(_$Unsubscribe) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Unsubscribe implements Unsubscribe {
  const _$Unsubscribe();

  @override
  String toString() {
    return 'ProfileInfoEvent.unsubscribe()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Unsubscribe);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() subscribe,
    required TResult Function() unsubscribe,
    required TResult Function() loadMore,
  }) {
    return unsubscribe();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? subscribe,
    TResult? Function()? unsubscribe,
    TResult? Function()? loadMore,
  }) {
    return unsubscribe?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? subscribe,
    TResult Function()? unsubscribe,
    TResult Function()? loadMore,
    required TResult orElse(),
  }) {
    if (unsubscribe != null) {
      return unsubscribe();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Subscribe value) subscribe,
    required TResult Function(Unsubscribe value) unsubscribe,
    required TResult Function(LoadMore value) loadMore,
  }) {
    return unsubscribe(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Subscribe value)? subscribe,
    TResult? Function(Unsubscribe value)? unsubscribe,
    TResult? Function(LoadMore value)? loadMore,
  }) {
    return unsubscribe?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Subscribe value)? subscribe,
    TResult Function(Unsubscribe value)? unsubscribe,
    TResult Function(LoadMore value)? loadMore,
    required TResult orElse(),
  }) {
    if (unsubscribe != null) {
      return unsubscribe(this);
    }
    return orElse();
  }
}

abstract class Unsubscribe implements ProfileInfoEvent {
  const factory Unsubscribe() = _$Unsubscribe;
}

/// @nodoc
abstract class _$$LoadMoreCopyWith<$Res> {
  factory _$$LoadMoreCopyWith(
          _$LoadMore value, $Res Function(_$LoadMore) then) =
      __$$LoadMoreCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadMoreCopyWithImpl<$Res>
    extends _$ProfileInfoEventCopyWithImpl<$Res, _$LoadMore>
    implements _$$LoadMoreCopyWith<$Res> {
  __$$LoadMoreCopyWithImpl(_$LoadMore _value, $Res Function(_$LoadMore) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadMore implements LoadMore {
  const _$LoadMore();

  @override
  String toString() {
    return 'ProfileInfoEvent.loadMore()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadMore);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() subscribe,
    required TResult Function() unsubscribe,
    required TResult Function() loadMore,
  }) {
    return loadMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? subscribe,
    TResult? Function()? unsubscribe,
    TResult? Function()? loadMore,
  }) {
    return loadMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? subscribe,
    TResult Function()? unsubscribe,
    TResult Function()? loadMore,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Subscribe value) subscribe,
    required TResult Function(Unsubscribe value) unsubscribe,
    required TResult Function(LoadMore value) loadMore,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Subscribe value)? subscribe,
    TResult? Function(Unsubscribe value)? unsubscribe,
    TResult? Function(LoadMore value)? loadMore,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Subscribe value)? subscribe,
    TResult Function(Unsubscribe value)? unsubscribe,
    TResult Function(LoadMore value)? loadMore,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class LoadMore implements ProfileInfoEvent {
  const factory LoadMore() = _$LoadMore;
}
