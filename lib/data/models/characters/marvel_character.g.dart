// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marvel_character.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MarvelCharacter _$$_MarvelCharacterFromJson(Map<String, dynamic> json) =>
    _$_MarvelCharacter(
      id: json['id'] as int,
      name: json['name'] as String,
      thumbnail:
          MarvelImage.fromJson(json['thumbnail'] as Map<String, dynamic>),
      modified: DateTime.parse(json['modified'] as String),
      resourceURI: json['resourceURI'] as String,
    );

Map<String, dynamic> _$$_MarvelCharacterToJson(_$_MarvelCharacter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'thumbnail': instance.thumbnail,
      'modified': instance.modified.toIso8601String(),
      'resourceURI': instance.resourceURI,
    };
