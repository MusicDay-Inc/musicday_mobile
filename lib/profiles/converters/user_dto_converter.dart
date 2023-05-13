import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:musicday_mobile/core/network/network_consts.dart';
import 'package:musicday_mobile/profiles/dtos/user_dto.dart';
import 'package:musicday_mobile/profiles/models/user.dart';

@Singleton(as: Converter<UserDto, User>)
class UserDtoConverter extends Converter<UserDto, User> {
  @override
  User convert(UserDto input) {
    return User(
      id: input.id,
      username: input.username,
      nickname: input.nickname,
      avatarUrl: "${NetworkConsts.baseUrl}/image/avatar/${input.id}",
      subscriberAmount: input.subscriberAmount,
      subscriptionsAmount: input.subscriptionsAmount,
    );
  }
}
