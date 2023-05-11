// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paged_response_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PagedResponseState<T> {
  List<T> get items => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PagedResponseStateCopyWith<T, PagedResponseState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PagedResponseStateCopyWith<T, $Res> {
  factory $PagedResponseStateCopyWith(PagedResponseState<T> value,
          $Res Function(PagedResponseState<T>) then) =
      _$PagedResponseStateCopyWithImpl<T, $Res, PagedResponseState<T>>;
  @useResult
  $Res call({List<T> items, bool isLoading});
}

/// @nodoc
class _$PagedResponseStateCopyWithImpl<T, $Res,
        $Val extends PagedResponseState<T>>
    implements $PagedResponseStateCopyWith<T, $Res> {
  _$PagedResponseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PagedResponseStateCopyWith<T, $Res>
    implements $PagedResponseStateCopyWith<T, $Res> {
  factory _$$_PagedResponseStateCopyWith(_$_PagedResponseState<T> value,
          $Res Function(_$_PagedResponseState<T>) then) =
      __$$_PagedResponseStateCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({List<T> items, bool isLoading});
}

/// @nodoc
class __$$_PagedResponseStateCopyWithImpl<T, $Res>
    extends _$PagedResponseStateCopyWithImpl<T, $Res, _$_PagedResponseState<T>>
    implements _$$_PagedResponseStateCopyWith<T, $Res> {
  __$$_PagedResponseStateCopyWithImpl(_$_PagedResponseState<T> _value,
      $Res Function(_$_PagedResponseState<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? isLoading = null,
  }) {
    return _then(_$_PagedResponseState<T>(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PagedResponseState<T> implements _PagedResponseState<T> {
  const _$_PagedResponseState(
      {required final List<T> items, required this.isLoading})
      : _items = items;

  final List<T> _items;
  @override
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final bool isLoading;

  @override
  String toString() {
    return 'PagedResponseState<$T>(items: $items, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PagedResponseState<T> &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PagedResponseStateCopyWith<T, _$_PagedResponseState<T>> get copyWith =>
      __$$_PagedResponseStateCopyWithImpl<T, _$_PagedResponseState<T>>(
          this, _$identity);
}

abstract class _PagedResponseState<T> implements PagedResponseState<T> {
  const factory _PagedResponseState(
      {required final List<T> items,
      required final bool isLoading}) = _$_PagedResponseState<T>;

  @override
  List<T> get items;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_PagedResponseStateCopyWith<T, _$_PagedResponseState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
