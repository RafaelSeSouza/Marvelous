import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marvelous/data/DTOs/marvel_container_dto.dart';

part 'marvel_wrapper_dto.freezed.dart';
part 'marvel_wrapper_dto.g.dart';

/// Data transfer object for a Marvel API response wrapper, as described on
/// `https://developer.marvel.com/documentation/apiresults`.
@Freezed(genericArgumentFactories: true)
class MarvelWrapperDTO<T extends MarvelContainerDTO>
    with _$MarvelWrapperDTO<T> {
  const factory MarvelWrapperDTO({
    required int code,
    required String status,
    required T data,
    @Default('') String eTag,
    required String copyright,
    required String attributionText,
    required String attributionHTML,
  }) = _MarvelWrapperDTO;

  factory MarvelWrapperDTO.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$MarvelWrapperDTOFromJson(json, fromJsonT);
}
