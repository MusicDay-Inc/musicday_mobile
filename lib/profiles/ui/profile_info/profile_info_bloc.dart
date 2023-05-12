import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:musicday_mobile/auth/repositories/auth_session_repository.dart';
import 'package:musicday_mobile/core/common/pair.dart';
import 'package:musicday_mobile/core/logging/logger.dart';
import 'package:musicday_mobile/core/logging/logger_factory.dart';
import 'package:musicday_mobile/core/paging/paged_response.dart';
import 'package:musicday_mobile/profiles/di/profiles_scope.dart';
import 'package:musicday_mobile/profiles/models/user.dart';
import 'package:musicday_mobile/profiles/repositories/users_repository.dart';
import 'package:musicday_mobile/profiles/ui/profile_info/profile_info_event.dart';
import 'package:musicday_mobile/profiles/ui/profile_info/profile_info_state.dart';
import 'package:musicday_mobile/releases/models/activity.dart';
import 'package:rxdart/rxdart.dart';

@Injectable(scope: ProfilesScope.name)
class ProfileInfoBloc extends Bloc<ProfileInfoEvent, ProfileInfoState> {
  final Logger _logger;
  late StreamSubscription subscription;

  ProfileInfoBloc({
    @factoryParam String? userId,
    required AuthSessionRepository authSessionRepository,
    required UsersRepository usersRepository,
    required LoggerFactory loggerFactory,
  })  : _logger = loggerFactory.create("ProfileInfoBloc"),
        super(const ProfileInfoState.loading()) {
    _logger.debug("init, userId = $userId");
    Stream<Pair<User, bool>?> stream;
    PagedResponse<Activity>? response;

    if (userId != null) {
      response = usersRepository.getActivities(userId);
      response.loadMore();
      stream = Rx.combineLatest2(usersRepository.getUserById(userId), response.state, (event, state) {
        if (event == null) {
          _logger.debug("init, stream event == null");
          return;
        }

        _logger.debug("init, stream event != null");
        // ignore: invalid_use_of_visible_for_testing_member
        emit(ProfileInfoState.data(event.first, state.items, state.isLoading, event.second));
        return null;
      });
    } else {
      stream = Stream.fromFuture(authSessionRepository.getCurrentUserId()).switchMap((id) {
        response = usersRepository.getActivities(id!);
        response!.loadMore();
        return Rx.combineLatest2(usersRepository.getUserById(id), response!.state, (event, state) {
          if (event == null) {
            _logger.debug("init, stream event == null");
            return;
          }

          _logger.debug("init, stream event != null");
          // ignore: invalid_use_of_visible_for_testing_member
          emit(ProfileInfoState.data(event.first, state.items, state.isLoading, event.second));
          return null;
        });
      });
    }

    subscription = stream.listen((event) {});
    on<ProfileInfoEvent>((event, emit) async {
      await event.when(
        loadMore: () => response?.loadMore(),
        subscribe: () async {
          _logger.debug("init, received ProfileInfoEvent subscribe");
          await usersRepository.subscribeToUser(userId!);
        },
        unsubscribe: () async {
          _logger.debug("init, received ProfileInfoEvent unsubscribe");
          await usersRepository.unsubscribeToUser(userId!);
        },
      );
    });
  }

  @override
  Future<void> close() async {
    _logger.debug("close()");
    await subscription.cancel();
    return super.close();
  }
}
