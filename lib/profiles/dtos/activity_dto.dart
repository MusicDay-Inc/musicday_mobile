import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:musicday_mobile/releases/dtos/album_dto.dart';
import 'package:musicday_mobile/releases/dtos/review_dto.dart';
import 'package:musicday_mobile/releases/dtos/song_dto.dart';

part 'activity_dto.g.dart';

@JsonSerializable()
class ActivityDto extends ReviewDto {
  @JsonKey(name: "album")
  final AlbumDto? album;
  @JsonKey(name: "song")
  final SongDto? song;

  ActivityDto({
    required super.id,
    required super.userId,
    required super.publishedAt,
    required super.text,
    required super.score,
    this.album,
    this.song,
  });

  @override
  Map<String, dynamic> toJson() => _$ActivityDtoToJson(this);

  @override
  factory ActivityDto.fromJson(Map<String, dynamic> data) => _$ActivityDtoFromJson(data);
}
