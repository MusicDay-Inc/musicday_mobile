import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_info_event.freezed.dart';

@freezed
class ProfileInfoEvent with _$ProfileInfoEvent {
  const factory ProfileInfoEvent.subscribe() = Subscribe;
  const factory ProfileInfoEvent.unsubscribe() = Unsubscribe;
  const factory ProfileInfoEvent.loadMore() = LoadMore;
  const factory ProfileInfoEvent.logOut() = LogOut;
}
