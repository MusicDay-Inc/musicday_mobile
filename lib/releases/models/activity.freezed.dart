// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Activity {
  Release get release => throw _privateConstructorUsedError;
  Review get review => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ActivityCopyWith<Activity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityCopyWith<$Res> {
  factory $ActivityCopyWith(Activity value, $Res Function(Activity) then) =
      _$ActivityCopyWithImpl<$Res, Activity>;
  @useResult
  $Res call({Release release, Review review});

  $ReviewCopyWith<$Res> get review;
}

/// @nodoc
class _$ActivityCopyWithImpl<$Res, $Val extends Activity>
    implements $ActivityCopyWith<$Res> {
  _$ActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? release = null,
    Object? review = null,
  }) {
    return _then(_value.copyWith(
      release: null == release
          ? _value.release
          : release // ignore: cast_nullable_to_non_nullable
              as Release,
      review: null == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as Review,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReviewCopyWith<$Res> get review {
    return $ReviewCopyWith<$Res>(_value.review, (value) {
      return _then(_value.copyWith(review: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ActivityCopyWith<$Res> implements $ActivityCopyWith<$Res> {
  factory _$$_ActivityCopyWith(
          _$_Activity value, $Res Function(_$_Activity) then) =
      __$$_ActivityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Release release, Review review});

  @override
  $ReviewCopyWith<$Res> get review;
}

/// @nodoc
class __$$_ActivityCopyWithImpl<$Res>
    extends _$ActivityCopyWithImpl<$Res, _$_Activity>
    implements _$$_ActivityCopyWith<$Res> {
  __$$_ActivityCopyWithImpl(
      _$_Activity _value, $Res Function(_$_Activity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? release = null,
    Object? review = null,
  }) {
    return _then(_$_Activity(
      release: null == release
          ? _value.release
          : release // ignore: cast_nullable_to_non_nullable
              as Release,
      review: null == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as Review,
    ));
  }
}

/// @nodoc

class _$_Activity implements _Activity {
  const _$_Activity({required this.release, required this.review});

  @override
  final Release release;
  @override
  final Review review;

  @override
  String toString() {
    return 'Activity(release: $release, review: $review)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Activity &&
            (identical(other.release, release) || other.release == release) &&
            (identical(other.review, review) || other.review == review));
  }

  @override
  int get hashCode => Object.hash(runtimeType, release, review);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ActivityCopyWith<_$_Activity> get copyWith =>
      __$$_ActivityCopyWithImpl<_$_Activity>(this, _$identity);
}

abstract class _Activity implements Activity {
  const factory _Activity(
      {required final Release release,
      required final Review review}) = _$_Activity;

  @override
  Release get release;
  @override
  Review get review;
  @override
  @JsonKey(ignore: true)
  _$$_ActivityCopyWith<_$_Activity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UserActivity {
  Activity get activity => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserActivityCopyWith<UserActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserActivityCopyWith<$Res> {
  factory $UserActivityCopyWith(
          UserActivity value, $Res Function(UserActivity) then) =
      _$UserActivityCopyWithImpl<$Res, UserActivity>;
  @useResult
  $Res call({Activity activity, User user});

  $ActivityCopyWith<$Res> get activity;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$UserActivityCopyWithImpl<$Res, $Val extends UserActivity>
    implements $UserActivityCopyWith<$Res> {
  _$UserActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      activity: null == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as Activity,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ActivityCopyWith<$Res> get activity {
    return $ActivityCopyWith<$Res>(_value.activity, (value) {
      return _then(_value.copyWith(activity: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserActivityCopyWith<$Res>
    implements $UserActivityCopyWith<$Res> {
  factory _$$_UserActivityCopyWith(
          _$_UserActivity value, $Res Function(_$_UserActivity) then) =
      __$$_UserActivityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Activity activity, User user});

  @override
  $ActivityCopyWith<$Res> get activity;
  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_UserActivityCopyWithImpl<$Res>
    extends _$UserActivityCopyWithImpl<$Res, _$_UserActivity>
    implements _$$_UserActivityCopyWith<$Res> {
  __$$_UserActivityCopyWithImpl(
      _$_UserActivity _value, $Res Function(_$_UserActivity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = null,
    Object? user = null,
  }) {
    return _then(_$_UserActivity(
      activity: null == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as Activity,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$_UserActivity implements _UserActivity {
  const _$_UserActivity({required this.activity, required this.user});

  @override
  final Activity activity;
  @override
  final User user;

  @override
  String toString() {
    return 'UserActivity(activity: $activity, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserActivity &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, activity, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserActivityCopyWith<_$_UserActivity> get copyWith =>
      __$$_UserActivityCopyWithImpl<_$_UserActivity>(this, _$identity);
}

abstract class _UserActivity implements UserActivity {
  const factory _UserActivity(
      {required final Activity activity,
      required final User user}) = _$_UserActivity;

  @override
  Activity get activity;
  @override
  User get user;
  @override
  @JsonKey(ignore: true)
  _$$_UserActivityCopyWith<_$_UserActivity> get copyWith =>
      throw _privateConstructorUsedError;
}
