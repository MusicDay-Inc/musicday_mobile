import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:musicday_mobile/releases/models/song.dart';

part 'song_info_state.freezed.dart';

@freezed
class SongInfoState with _$SongInfoState {
  const factory SongInfoState.loading() = Loading;
  const factory SongInfoState.data(Song song) = Data;
}
