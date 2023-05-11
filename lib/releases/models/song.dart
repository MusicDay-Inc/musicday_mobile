import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:musicday_mobile/releases/models/release.dart';

part 'song.freezed.dart';

@freezed
class Song extends Release with _$Song {
  @Implements<Release>()
  const factory Song({
    required String id,
    required String name,
    required String author,
    required String? avatarUrl,
    required int durationInSeconds,
    required int year,
  }) = _Song;
}
