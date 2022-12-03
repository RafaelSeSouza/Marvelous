// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marvel_wrapper_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MarvelWrapperDTO<T>
    _$$_MarvelWrapperDTOFromJson<T extends MarvelContainerDTO<dynamic>>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
        _$_MarvelWrapperDTO<T>(
          code: json['code'] as int,
          status: json['status'] as String,
          data: fromJsonT(json['data']),
          eTag: json['eTag'] as String? ?? '',
          copyright: json['copyright'] as String,
          attributionText: json['attributionText'] as String,
          attributionHTML: json['attributionHTML'] as String,
        );

Map<String, dynamic>
    _$$_MarvelWrapperDTOToJson<T extends MarvelContainerDTO<dynamic>>(
  _$_MarvelWrapperDTO<T> instance,
  Object? Function(T value) toJsonT,
) =>
        <String, dynamic>{
          'code': instance.code,
          'status': instance.status,
          'data': toJsonT(instance.data),
          'eTag': instance.eTag,
          'copyright': instance.copyright,
          'attributionText': instance.attributionText,
          'attributionHTML': instance.attributionHTML,
        };
