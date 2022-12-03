// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marvel_container_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MarvelContainerDTO<T> _$$_MarvelContainerDTOFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$_MarvelContainerDTO<T>(
      results: (json['results'] as List<dynamic>).map(fromJsonT).toList(),
      offset: json['offset'] as int,
      limit: json['limit'] as int,
      total: json['total'] as int,
      count: json['count'] as int,
    );

Map<String, dynamic> _$$_MarvelContainerDTOToJson<T>(
  _$_MarvelContainerDTO<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'results': instance.results.map(toJsonT).toList(),
      'offset': instance.offset,
      'limit': instance.limit,
      'total': instance.total,
      'count': instance.count,
    };
