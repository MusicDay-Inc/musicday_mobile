import 'package:freezed_annotation/freezed_annotation.dart';

part 'write_review_dialog_event.freezed.dart';

@freezed
class WriteReviewDialogEvent with _$WriteReviewDialogEvent {
  const factory WriteReviewDialogEvent.submit({required int rating, String? comment}) = Submit;
}
