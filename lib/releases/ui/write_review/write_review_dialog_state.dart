import 'package:freezed_annotation/freezed_annotation.dart';

part 'write_review_dialog_state.freezed.dart';

@freezed
class WriteReviewDialogState with _$WriteReviewDialogState {
  const factory WriteReviewDialogState.initial() = Initial;
  const factory WriteReviewDialogState.serverError() = ServerError;
  const factory WriteReviewDialogState.loading() = Loading;
  const factory WriteReviewDialogState.success() = Success;
}
