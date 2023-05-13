import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:musicday_mobile/profiles/dtos/user_dto.dart';
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
  @JsonKey(name: "user")
  final UserDto? user;

  ActivityDto({
    required super.id,
    required super.publishedAt,
    required super.text,
    required super.score,
    this.album,
    this.song,
    this.user,
  });

  @override
  Map<String, dynamic> toJson() => _$ActivityDtoToJson(this);

  @override
  factory ActivityDto.fromJson(Map<String, dynamic> data) => _$ActivityDtoFromJson(data);
}
