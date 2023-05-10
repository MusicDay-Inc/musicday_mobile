import 'package:json_annotation/json_annotation.dart';
import 'package:musicday_mobile/releases/dtos/album_dto.dart';
import 'package:musicday_mobile/releases/dtos/review_dto.dart';

part 'album_by_id_response.g.dart';

@JsonSerializable()
class AlbumByIdResponse {
  @JsonKey(name: "album")
  final AlbumDto album;
  @JsonKey(name: "review")
  final ReviewDto review;

  AlbumByIdResponse({
    required this.album,
    required this.review,
  });

  Map<String, dynamic> toJson() => _$AlbumByIdResponseToJson(this);

  factory AlbumByIdResponse.fromJson(Map<String, dynamic> data) => _$AlbumByIdResponseFromJson(data);
}
