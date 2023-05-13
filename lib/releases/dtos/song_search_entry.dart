import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:musicday_mobile/releases/dtos/song_dto.dart';

part 'song_search_entry.g.dart';

@JsonSerializable()
class SongSearchEntry {
  @JsonKey(name: "song")
  final SongDto song;

  SongSearchEntry({
    required this.song,
  });

  Map<String, dynamic> toJson() => _$SongSearchEntryToJson(this);

  factory SongSearchEntry.fromJson(Map<String, dynamic> data) => _$SongSearchEntryFromJson(data);
}
