import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:musicday_mobile/profiles/di/profiles_scope.dart';
import 'package:musicday_mobile/profiles/models/user.dart';
import 'package:musicday_mobile/profiles/ui/profile_info/profile_info_event.dart';
import 'package:musicday_mobile/profiles/ui/profile_info/profile_info_state.dart';
import 'package:musicday_mobile/releases/models/activity.dart';
import 'package:musicday_mobile/releases/models/review.dart';
import 'package:musicday_mobile/releases/models/song.dart';

@Injectable(scope: ProfilesScope.name)
class ProfileInfoBloc extends Bloc<ProfileInfoEvent, ProfileInfoState> {
  ProfileInfoBloc({@factoryParam String? userId}) : super(const ProfileInfoState.loading()) {
    emit(
      ProfileInfoState.data(
        const User(
          id: 'id',
          nickname: "Maxim Mityushkin",
          username: "kotlinovsky",
          avatarUrl: '',
          subscriberAmount: 1,
          subscriptionsAmount: 1,
        ),
        [
          Activity(
            release: const Song(
              id: "id",
              name: "Zenyatta Mondatta",
              author: "The Police",
              avatarUrl: null,
              durationInSeconds: 12,
              year: 1988,
            ),
            review: Review(
              id: "id",
              text:
                  "Есть много вариантов Lorem Ipsum, но большинство из них имеет не всегда приемлемые модификации, например, юмористические вставки или слова, которые даже отдалённо не напоминают латынь. Если вам нужен Lorem Ipsum для серьёзного проекта, вы наверняка не хотите какой-нибудь шутки, скрытой в середине абзаца.",
              rating: 2,
              publishTime: DateTime.now(),
            ),
          ),
          Activity(
            release: const Song(
              id: "id",
              name: "Zenyatta Mondatta",
              author: "The Police",
              avatarUrl: null,
              durationInSeconds: 12,
              year: 1988,
            ),
            review: Review(
              id: "id",
              text:
                  "Есть много вариантов Lorem Ipsum, но большинство из них имеет не всегда приемлемые модификации, например, юмористические вставки или слова, которые даже отдалённо не напоминают латынь. Если вам нужен Lorem Ipsum для серьёзного проекта, вы наверняка не хотите какой-нибудь шутки, скрытой в середине абзаца.",
              rating: 2,
              publishTime: DateTime.now(),
            ),
          ),
        ],
        false,
      ),
    );
  }
}
