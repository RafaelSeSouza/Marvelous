import 'package:freezed_annotation/freezed_annotation.dart';

part 'marvel_container_dto.freezed.dart';
part 'marvel_container_dto.g.dart';

/// Data transfer object for a Marvel API container, as described on
/// `https://developer.marvel.com/documentation/apiresults`.
@Freezed(genericArgumentFactories: true)
class MarvelContainerDTO<T> with _$MarvelContainerDTO<T> {
  const factory MarvelContainerDTO({
    required List<T> results,
    required int offset,
    required int limit,
    required int total,
    required int count,
  }) = _MarvelContainerDTO;

  factory MarvelContainerDTO.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$MarvelContainerDTOFromJson(json, fromJsonT);
}
