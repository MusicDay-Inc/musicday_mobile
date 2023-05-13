import 'package:json_annotation/json_annotation.dart';
import 'package:musicday_mobile/releases/dtos/album_dto.dart';
import 'package:musicday_mobile/releases/dtos/review_dto.dart';
import 'package:musicday_mobile/releases/dtos/song_dto.dart';

part 'delete_review_response.g.dart';

@JsonSerializable()
class DeleteReviewResponse extends ReviewDto {
  @JsonKey(name: "album")
  final AlbumDto? album;
  @JsonKey(name: "song")
  final SongDto? song;

  DeleteReviewResponse({
    required super.id,
    required super.publishedAt,
    required super.text,
    required super.score,
    required this.album,
    required this.song,
  });

  @override
  Map<String, dynamic> toJson() => _$DeleteReviewResponseToJson(this);

  @override
  factory DeleteReviewResponse.fromJson(Map<String, dynamic> data) => _$DeleteReviewResponseFromJson(data);
}
