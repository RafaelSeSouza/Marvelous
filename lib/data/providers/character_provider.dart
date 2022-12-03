import 'package:flutter/foundation.dart';

import '../DTOs/marvel_container_dto.dart';
import '../DTOs/marvel_wrapper_dto.dart';
import '../models/characters/marvel_character.dart';
import '../network/net_client.dart';

@immutable
class CharacterProvider {
  final NetClient _client;

  const CharacterProvider(
    NetClient client,
  ) : _client = client;

  Future<MarvelWrapperDTO<MarvelContainerDTO<MarvelCharacter>>> getCharacters({
    String name = '',
    String nameStartsWith = '',
    String modifiedSince = '',
    String comics = '',
    String series = '',
    String events = '',
    String stories = '',
    String orderBy = '',
    int limit = 20,
    int offset = 0,
  }) async {
    return await _client.get(
      '/v1/public/characters',
      queryParameters: {
        if (name.isNotEmpty) 'name': name,
        if (nameStartsWith.isNotEmpty) 'nameStartsWith': nameStartsWith,
        if (modifiedSince.isNotEmpty) 'modifiedSince': modifiedSince,
        if (comics.isNotEmpty) 'comics': comics,
        if (series.isNotEmpty) 'series': series,
        if (events.isNotEmpty) 'events': events,
        if (stories.isNotEmpty) 'stories': stories,
        if (orderBy.isNotEmpty) 'orderBy': orderBy,
        'limit': limit,
        'offset': offset,
      },
      fromJson: (e) => MarvelCharacter.fromJson(e),
    );
  }
}
