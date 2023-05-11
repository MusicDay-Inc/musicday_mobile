import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:musicday_mobile/releases/models/release.dart';

part 'album.freezed.dart';

@freezed
class Album extends Release with _$Album {
  @Implements<Release>()
  const factory Album({
    required String id,
    required String name,
    required String author,
    required String? avatarUrl,
    required int songsCount,
    required int year,
  }) = _Album;
}
