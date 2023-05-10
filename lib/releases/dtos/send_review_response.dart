import 'package:json_annotation/json_annotation.dart';
import 'package:musicday_mobile/releases/dtos/album_dto.dart';
import 'package:musicday_mobile/releases/dtos/review_dto.dart';
import 'package:musicday_mobile/releases/dtos/song_dto.dart';

part 'send_review_response.g.dart';

@JsonSerializable()
class SendReviewResponse extends ReviewDto {
  @JsonKey(name: "album")
  final AlbumDto? album;
  @JsonKey(name: "song")
  final SongDto? song;

  SendReviewResponse({
    required super.id,
    required super.userId,
    required super.publishedAt,
    required super.text,
    required super.score,
    required this.album,
    required this.song,
  });

  @override
  Map<String, dynamic> toJson() => _$SendReviewResponseToJson(this);

  @override
  factory SendReviewResponse.fromJson(Map<String, dynamic> data) => _$SendReviewResponseFromJson(data);
}
