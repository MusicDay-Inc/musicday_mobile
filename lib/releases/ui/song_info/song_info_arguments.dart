import 'package:freezed_annotation/freezed_annotation.dart';

part 'song_info_arguments.freezed.dart';

@freezed
class SongInfoArguments with _$SongInfoArguments {
  const factory SongInfoArguments({
    required String songId,
    required bool isSong,
  }) = _SongInfoArguments;
}
