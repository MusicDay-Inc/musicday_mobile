import 'package:freezed_annotation/freezed_annotation.dart';

part 'paged_response_event.freezed.dart';

@freezed
class PagedResponseEvent with _$PagedResponseEvent {
  const factory PagedResponseEvent.loadMore() = LoadMore;
}
