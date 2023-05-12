import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:musicday_mobile/auth/repositories/auth_session_repository.dart';
import 'package:musicday_mobile/core/common/pair.dart';
import 'package:musicday_mobile/profiles/di/profiles_scope.dart';
import 'package:musicday_mobile/profiles/models/user.dart';
import 'package:musicday_mobile/profiles/repositories/users_repository.dart';
import 'package:musicday_mobile/profiles/ui/profile_info/profile_info_event.dart';
import 'package:musicday_mobile/profiles/ui/profile_info/profile_info_state.dart';
import 'package:rxdart/rxdart.dart';

@Injectable(scope: ProfilesScope.name)
class ProfileInfoBloc extends Bloc<ProfileInfoEvent, ProfileInfoState> {
  late StreamSubscription subscription;

  ProfileInfoBloc({
    @factoryParam String? userId,
    required AuthSessionRepository authSessionRepository,
    required UsersRepository usersRepository,
  }) : super(const ProfileInfoState.loading()) {
    Stream<Pair<User, bool>?> stream;

    if (userId != null) {
      stream = usersRepository.getUserById(userId);
    } else {
      stream = Stream.fromFuture(authSessionRepository.getCurrentUserId()).switchMap((event) {
        return usersRepository.getUserById(event!);
      });
    }

    subscription = stream.listen((event) {
      if (event == null) {
        return;
      }

      emit(ProfileInfoState.data(event.first, [], false, event.second));
    });

    on<ProfileInfoEvent>((event, emit) async {
      await event.when(
        subscribe: () async => await usersRepository.subscribeToUser(userId!),
        unsubscribe: () async => await usersRepository.unsubscribeToUser(userId!),
      );
    });
  }

  @override
  Future<void> close() async {
    await subscription.cancel();
    return super.close();
  }
}
