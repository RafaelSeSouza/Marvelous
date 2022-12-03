import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/characters/marvel_character.dart';
import '../../data/models/characters/marvel_character_filter.dart';
import '../../data/models/characters/marvel_character_sort.dart';
import '../../data/models/general/pagination.dart';
import '../../data/models/helpers/sort_field.dart';

part 'characters_states.freezed.dart';

enum CharactersAction {
  load,
  loadMore,
}

enum CharactersErrors {
  onLoading,
  onLoadingMore,
  invalidCredentials,
}

@freezed
class CharactersState with _$CharactersState {
  const CharactersState._();

  const factory CharactersState({
    @Default({}) Set<CharactersAction> actions,
    @Default({}) Set<CharactersErrors> errors,
    @Default([]) List<MarvelCharacter> items,
    @Default(Pagination()) Pagination pagination,
    MarvelCharacterFilter? filter,
    Set<SortField<MarvelCharacterSort>>? sort,
  }) = _CharactersState;

  bool get busy => actions.isNotEmpty;

  bool get hasError => errors.isNotEmpty;
}
