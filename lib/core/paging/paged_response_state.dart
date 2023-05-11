import 'package:freezed_annotation/freezed_annotation.dart';

part 'paged_response_state.freezed.dart';

@freezed
class PagedResponseState<T> with _$PagedResponseState<T> {
  const factory PagedResponseState({
    required List<T> items,
    required bool isLoading,
  }) = _PagedResponseState;
}
