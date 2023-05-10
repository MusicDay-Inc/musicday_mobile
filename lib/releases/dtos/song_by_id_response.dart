import 'package:json_annotation/json_annotation.dart';
import 'package:musicday_mobile/releases/dtos/review_dto.dart';
import 'package:musicday_mobile/releases/dtos/song_dto.dart';

part 'song_by_id_response.g.dart';

@JsonSerializable()
class SongByIdResponse {
  @JsonKey(name: "song")
  final SongDto song;
  @JsonKey(name: "review")
  final ReviewDto review;

  SongByIdResponse({
    required this.song,
    required this.review,
  });

  factory SongByIdResponse.fromJson(Map<String, dynamic> data) => _$SongByIdResponseFromJson(data);

  Map<String, dynamic> toJson() => _$SongByIdResponseToJson(this);
}
