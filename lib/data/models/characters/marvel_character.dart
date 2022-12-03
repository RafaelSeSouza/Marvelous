import 'package:freezed_annotation/freezed_annotation.dart';

import '../images/marvel_image.dart';

part 'marvel_character.freezed.dart';
part 'marvel_character.g.dart';

/// Holds the data for a Marvel character.
@freezed
class MarvelCharacter with _$MarvelCharacter {
  const factory MarvelCharacter({
    required int id,
    required String name,
    required MarvelImage thumbnail,
    required DateTime modified,
    required String resourceURI,
  }) = _MarvelCharacter;

  factory MarvelCharacter.fromJson(Map<String, dynamic> json) =>
      _$MarvelCharacterFromJson(json);
}
