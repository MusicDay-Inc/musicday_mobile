// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song_search_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SongSearchEntry _$SongSearchEntryFromJson(Map<String, dynamic> json) =>
    SongSearchEntry(
      song: SongDto.fromJson(json['song'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SongSearchEntryToJson(SongSearchEntry instance) =>
    <String, dynamic>{
      'song': instance.song,
    };
