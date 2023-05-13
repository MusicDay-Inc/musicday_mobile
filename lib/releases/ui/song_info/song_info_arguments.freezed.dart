// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'song_info_arguments.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SongInfoArguments {
  String get songId => throw _privateConstructorUsedError;
  bool get isSong => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SongInfoArgumentsCopyWith<SongInfoArguments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SongInfoArgumentsCopyWith<$Res> {
  factory $SongInfoArgumentsCopyWith(
          SongInfoArguments value, $Res Function(SongInfoArguments) then) =
      _$SongInfoArgumentsCopyWithImpl<$Res, SongInfoArguments>;
  @useResult
  $Res call({String songId, bool isSong});
}

/// @nodoc
class _$SongInfoArgumentsCopyWithImpl<$Res, $Val extends SongInfoArguments>
    implements $SongInfoArgumentsCopyWith<$Res> {
  _$SongInfoArgumentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songId = null,
    Object? isSong = null,
  }) {
    return _then(_value.copyWith(
      songId: null == songId
          ? _value.songId
          : songId // ignore: cast_nullable_to_non_nullable
              as String,
      isSong: null == isSong
          ? _value.isSong
          : isSong // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SongInfoArgumentsCopyWith<$Res>
    implements $SongInfoArgumentsCopyWith<$Res> {
  factory _$$_SongInfoArgumentsCopyWith(_$_SongInfoArguments value,
          $Res Function(_$_SongInfoArguments) then) =
      __$$_SongInfoArgumentsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String songId, bool isSong});
}

/// @nodoc
class __$$_SongInfoArgumentsCopyWithImpl<$Res>
    extends _$SongInfoArgumentsCopyWithImpl<$Res, _$_SongInfoArguments>
    implements _$$_SongInfoArgumentsCopyWith<$Res> {
  __$$_SongInfoArgumentsCopyWithImpl(
      _$_SongInfoArguments _value, $Res Function(_$_SongInfoArguments) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? songId = null,
    Object? isSong = null,
  }) {
    return _then(_$_SongInfoArguments(
      songId: null == songId
          ? _value.songId
          : songId // ignore: cast_nullable_to_non_nullable
              as String,
      isSong: null == isSong
          ? _value.isSong
          : isSong // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SongInfoArguments implements _SongInfoArguments {
  const _$_SongInfoArguments({required this.songId, required this.isSong});

  @override
  final String songId;
  @override
  final bool isSong;

  @override
  String toString() {
    return 'SongInfoArguments(songId: $songId, isSong: $isSong)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SongInfoArguments &&
            (identical(other.songId, songId) || other.songId == songId) &&
            (identical(other.isSong, isSong) || other.isSong == isSong));
  }

  @override
  int get hashCode => Object.hash(runtimeType, songId, isSong);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SongInfoArgumentsCopyWith<_$_SongInfoArguments> get copyWith =>
      __$$_SongInfoArgumentsCopyWithImpl<_$_SongInfoArguments>(
          this, _$identity);
}

abstract class _SongInfoArguments implements SongInfoArguments {
  const factory _SongInfoArguments(
      {required final String songId,
      required final bool isSong}) = _$_SongInfoArguments;

  @override
  String get songId;
  @override
  bool get isSong;
  @override
  @JsonKey(ignore: true)
  _$$_SongInfoArgumentsCopyWith<_$_SongInfoArguments> get copyWith =>
      throw _privateConstructorUsedError;
}
