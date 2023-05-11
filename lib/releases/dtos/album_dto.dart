import 'package:freezed_annotation/freezed_annotation.dart';

part 'album_dto.g.dart';

@JsonSerializable()
class AlbumDto {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "name", defaultValue: "")
  final String name;
  @JsonKey(name: "author", defaultValue: "")
  final String author;
  @JsonKey(name: "date")
  final DateTime date;
  @JsonKey(name: "song_amount", defaultValue: 0)
  final int songsCount;

  AlbumDto({
    required this.id,
    required this.name,
    required this.author,
    required this.date,
    required this.songsCount,
  });

  Map<String, dynamic> toJson() => _$AlbumDtoToJson(this);

  factory AlbumDto.fromJson(Map<String, dynamic> data) => _$AlbumDtoFromJson(data);
}
