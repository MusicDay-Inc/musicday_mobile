import 'package:freezed_annotation/freezed_annotation.dart';

part 'song.freezed.dart';

@freezed
class Song with _$Song {
  const factory Song({
    required String id,
    required String name,
    required String author,
    required String? avatarUrl,
    required int duration,
    required int year,
  }) = _Song;
}
