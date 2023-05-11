import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:musicday_mobile/releases/models/release.dart';
import 'package:musicday_mobile/releases/models/review.dart';
import 'package:musicday_mobile/releases/models/user_review.dart';

part 'song_info_state.freezed.dart';

@freezed
class SongInfoState with _$SongInfoState {
  const factory SongInfoState.loading() = Loading;
  const factory SongInfoState.data(Release release, Review? review, double mean, List<UserReview> userReviews) = Data;
}
