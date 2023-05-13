import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:musicday_mobile/releases/dtos/album_dto.dart';

part 'album_search_entry.g.dart';

@JsonSerializable()
class AlbumSearchEntry {
  @JsonKey(name: "album")
  final AlbumDto album;

  AlbumSearchEntry({
    required this.album,
  });

  Map<String, dynamic> toJson() => _$AlbumSearchEntryToJson(this);

  factory AlbumSearchEntry.fromJson(Map<String, dynamic> data) => _$AlbumSearchEntryFromJson(data);
}
