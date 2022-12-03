import 'package:flutter/foundation.dart';
import 'package:marvelous/data/models/characters/marvel_character.dart';
import 'package:marvelous/data/models/characters/marvel_character_filter.dart';

import '../models/characters/marvel_character_sort.dart';
import '../models/general/extensions/dto_converter_extensions.dart';
import '../models/general/marvel_result.dart';
import '../models/helpers/sort_field.dart';
import '../providers/character_provider.dart';

@immutable
class CharacterRepository {
  final CharacterProvider _provider;

  const CharacterRepository({
    required CharacterProvider provider,
  }) : _provider = provider;

  Future<MarvelResult<MarvelCharacter>> getCharacters({
    MarvelCharacterFilter? filter,
    Set<SortField<MarvelCharacterSort>>? sort,
    int limit = 20,
    int offset = 0,
  }) async {
    final effectiveFilter = filter ?? const MarvelCharacterFilter();
    final effectiveSort = sort ??
        {
          const SortField(
            field: MarvelCharacterSort.modified,
            ascending: false,
          ),
        };

    final dto = await _provider.getCharacters(
      name: effectiveFilter.name,
      nameStartsWith: effectiveFilter.nameStartsWith,
      modifiedSince:
          effectiveFilter.modifiedSince?.microsecondsSinceEpoch.toString() ??
              '',
      comics: effectiveFilter.comics.join(','),
      series: effectiveFilter.series.join(','),
      events: effectiveFilter.events.join(','),
      stories: effectiveFilter.stories.join(','),
      orderBy: effectiveSort.format(),
      limit: limit,
      offset: offset,
    );

    return dto.toResult();
  }
}
