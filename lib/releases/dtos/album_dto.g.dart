// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumDto _$AlbumDtoFromJson(Map<String, dynamic> json) => AlbumDto(
      id: json['id'] as String,
      name: json['name'] as String,
      author: json['author'] as String,
      date: DateTime.parse(json['date'] as String),
      songsCount: json['song_amount'] as int,
    );

Map<String, dynamic> _$AlbumDtoToJson(AlbumDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'author': instance.author,
      'date': instance.date.toIso8601String(),
      'song_amount': instance.songsCount,
    };
