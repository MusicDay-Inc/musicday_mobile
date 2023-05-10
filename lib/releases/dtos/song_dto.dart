import 'package:json_annotation/json_annotation.dart';

part 'song_dto.g.dart';

@JsonSerializable()
class SongDto {
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "author")
  final String author;
  @JsonKey(name: "date")
  final DateTime date;
  @JsonKey(name: "duration")
  final int durationInNanoseconds;

  SongDto({
    required this.id,
    required this.name,
    required this.author,
    required this.date,
    required this.durationInNanoseconds,
  });

  Map<String, dynamic> toJson() => _$SongDtoToJson(this);

  factory SongDto.fromJson(Map<String, dynamic> data) => _$SongDtoFromJson(data);
}
