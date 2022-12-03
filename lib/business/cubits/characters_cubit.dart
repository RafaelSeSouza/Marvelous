import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelous/data/network/net_exception.dart';

import '../../data/models/characters/marvel_character_filter.dart';
import '../../data/models/characters/marvel_character_sort.dart';
import '../../data/models/general/pagination.dart';
import '../../data/models/helpers/sort_field.dart';
import '../../data/repositories/character_repository.dart';
import 'characters_states.dart';

/// Holds a paginated list of characters.
///
/// Filters and sorting can be applied on the load method.
class CharactersCubit extends Cubit<CharactersState> {
  final CharacterRepository _characterRepository;

  CharactersCubit({
    required CharacterRepository characterRepository,
    int limit = 10,
  })  : _characterRepository = characterRepository,
        super(
          CharactersState(
            pagination: Pagination(
              limit: limit,
            ),
          ),
        );

  /// Loads a page of characters.
  ///
  /// To load more pages, pass `true` on [loadMore].
  ///
  /// Supplying a filter and/or sort will reset the list.
  Future<void> load({
    MarvelCharacterFilter? filter,
    Set<SortField<MarvelCharacterSort>>? sort,
    bool loadMore = false,
  }) async {
    final effectiveFilter = filter ?? state.filter;
    final effectiveSort = sort ?? state.sort;

    final nextPage = loadMore &&
        effectiveFilter == state.filter &&
        effectiveSort == state.sort;

    final action = nextPage ? CharactersAction.loadMore : CharactersAction.load;

    if (nextPage && !state.pagination.hasNextPage) return;

    emit(
      state.copyWith(
        actions: state.actions.union({action}),
        errors: {},
      ),
    );

    try {
      final result = await _characterRepository.getCharacters(
        filter: effectiveFilter,
        sort: effectiveSort,
        limit: state.pagination.limit,
        offset: nextPage ? state.pagination.nextOffset : 0,
      );

      emit(
        state.copyWith(
          actions: state.actions.difference({action}),
          items: [
            if (nextPage) ...state.items,
            ...result.items,
          ],
          pagination: result.pagination,
          filter: effectiveFilter,
          sort: effectiveSort,
        ),
      );
    } on Exception catch (e) {
      emit(
        state.copyWith(
          actions: state.actions.difference({action}),
          errors: state.errors.union({
            (e is NetException && e.type == NetExceptionType.invalidCredentials)
                ? CharactersErrors.invalidCredentials
                : nextPage
                    ? CharactersErrors.onLoadingMore
                    : CharactersErrors.onLoading,
          }),
        ),
      );
    }
  }
}
