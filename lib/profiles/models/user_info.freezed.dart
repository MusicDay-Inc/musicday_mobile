// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserInfo {
  String get bio => throw _privateConstructorUsedError;
  bool get isSubscribed => throw _privateConstructorUsedError;
  int get albumAmount => throw _privateConstructorUsedError;
  int get songAmount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserInfoCopyWith<UserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoCopyWith<$Res> {
  factory $UserInfoCopyWith(UserInfo value, $Res Function(UserInfo) then) =
      _$UserInfoCopyWithImpl<$Res, UserInfo>;
  @useResult
  $Res call({String bio, bool isSubscribed, int albumAmount, int songAmount});
}

/// @nodoc
class _$UserInfoCopyWithImpl<$Res, $Val extends UserInfo>
    implements $UserInfoCopyWith<$Res> {
  _$UserInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bio = null,
    Object? isSubscribed = null,
    Object? albumAmount = null,
    Object? songAmount = null,
  }) {
    return _then(_value.copyWith(
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      isSubscribed: null == isSubscribed
          ? _value.isSubscribed
          : isSubscribed // ignore: cast_nullable_to_non_nullable
              as bool,
      albumAmount: null == albumAmount
          ? _value.albumAmount
          : albumAmount // ignore: cast_nullable_to_non_nullable
              as int,
      songAmount: null == songAmount
          ? _value.songAmount
          : songAmount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserInfoCopyWith<$Res> implements $UserInfoCopyWith<$Res> {
  factory _$$_UserInfoCopyWith(
          _$_UserInfo value, $Res Function(_$_UserInfo) then) =
      __$$_UserInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String bio, bool isSubscribed, int albumAmount, int songAmount});
}

/// @nodoc
class __$$_UserInfoCopyWithImpl<$Res>
    extends _$UserInfoCopyWithImpl<$Res, _$_UserInfo>
    implements _$$_UserInfoCopyWith<$Res> {
  __$$_UserInfoCopyWithImpl(
      _$_UserInfo _value, $Res Function(_$_UserInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bio = null,
    Object? isSubscribed = null,
    Object? albumAmount = null,
    Object? songAmount = null,
  }) {
    return _then(_$_UserInfo(
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      isSubscribed: null == isSubscribed
          ? _value.isSubscribed
          : isSubscribed // ignore: cast_nullable_to_non_nullable
              as bool,
      albumAmount: null == albumAmount
          ? _value.albumAmount
          : albumAmount // ignore: cast_nullable_to_non_nullable
              as int,
      songAmount: null == songAmount
          ? _value.songAmount
          : songAmount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_UserInfo implements _UserInfo {
  const _$_UserInfo(
      {required this.bio,
      required this.isSubscribed,
      required this.albumAmount,
      required this.songAmount});

  @override
  final String bio;
  @override
  final bool isSubscribed;
  @override
  final int albumAmount;
  @override
  final int songAmount;

  @override
  String toString() {
    return 'UserInfo(bio: $bio, isSubscribed: $isSubscribed, albumAmount: $albumAmount, songAmount: $songAmount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserInfo &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.isSubscribed, isSubscribed) ||
                other.isSubscribed == isSubscribed) &&
            (identical(other.albumAmount, albumAmount) ||
                other.albumAmount == albumAmount) &&
            (identical(other.songAmount, songAmount) ||
                other.songAmount == songAmount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, bio, isSubscribed, albumAmount, songAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserInfoCopyWith<_$_UserInfo> get copyWith =>
      __$$_UserInfoCopyWithImpl<_$_UserInfo>(this, _$identity);
}

abstract class _UserInfo implements UserInfo {
  const factory _UserInfo(
      {required final String bio,
      required final bool isSubscribed,
      required final int albumAmount,
      required final int songAmount}) = _$_UserInfo;

  @override
  String get bio;
  @override
  bool get isSubscribed;
  @override
  int get albumAmount;
  @override
  int get songAmount;
  @override
  @JsonKey(ignore: true)
  _$$_UserInfoCopyWith<_$_UserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
