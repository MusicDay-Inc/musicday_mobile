// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SongDto _$SongDtoFromJson(Map<String, dynamic> json) => SongDto(
      id: json['id'] as String,
      name: json['name'] as String,
      author: json['author'] as String,
      date: DateTime.parse(json['date'] as String),
      durationInNanoseconds: json['duration'] as int,
    );

Map<String, dynamic> _$SongDtoToJson(SongDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'author': instance.author,
      'date': instance.date.toIso8601String(),
      'duration': instance.durationInNanoseconds,
    };
