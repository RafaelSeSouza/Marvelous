import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvelous/business/cubits/characters_cubit.dart';
import 'package:marvelous/business/cubits/characters_states.dart';
import 'package:marvelous/data/models/characters/marvel_character.dart';
import 'package:marvelous/data/models/characters/marvel_character_filter.dart';
import 'package:marvelous/data/models/characters/marvel_character_sort.dart';
import 'package:marvelous/data/models/general/attribution.dart';
import 'package:marvelous/data/models/general/marvel_result.dart';
import 'package:marvelous/data/models/general/pagination.dart';
import 'package:marvelous/data/models/helpers/sort_field.dart';
import 'package:marvelous/data/models/images/marvel_image.dart';
import 'package:marvelous/data/network/net_exception.dart';
import 'package:marvelous/data/repositories/character_repository.dart';
import 'package:mocktail/mocktail.dart';

class CharacterRepositoryMock extends Mock implements CharacterRepository {}

class MarvelResultMock extends Mock implements MarvelResult<MarvelCharacter> {}

const _defaultLimit = 10;

final _characterRepository = CharacterRepositoryMock();
final _marvelResult = MarvelResultMock();
late CharactersCubit _charactersCubit;
late Pagination _pagination;

final _firstPageResults = _characters.getRange(0, _defaultLimit).toList();
final _secondPageResults =
    _characters.getRange(_defaultLimit, _characters.length).toList();

final _firstPagination = Pagination(
  offset: 0,
  limit: _defaultLimit,
  total: _characters.length,
);

final _secondPagination = Pagination(
  offset: _defaultLimit,
  limit: _defaultLimit,
  total: _characters.length,
);

final _characters = List.generate(
  _defaultLimit + 4,
  (i) => MarvelCharacter(
    id: i,
    name: 'Character $i',
    modified: DateTime(2022),
    resourceURI: 'Resource $i',
    thumbnail: MarvelImage(
      path: 'marvelImage.com/$i',
      extension: 'png',
    ),
  ),
);

void main() {
  setUp(() {
    reset(_characterRepository);
    reset(_marvelResult);

    _charactersCubit = CharactersCubit(
      characterRepository: _characterRepository,
    );

    when(
      () => _characterRepository.getCharacters(
        filter: any(named: 'filter'),
        sort: any(named: 'sort'),
        limit: any(named: 'limit'),
        offset: any(named: 'offset'),
      ),
    ).thenAnswer(
      (_) async => _marvelResult,
    );

    when(() => _marvelResult.items).thenReturn([]);
    when(() => _marvelResult.pagination).thenReturn(const Pagination());
  });

  group('Creation', _creationTests);
  group('Load', _loadTests);
}

void _creationTests() {
  test('Set default pagination limit', () {
    final cubit = CharactersCubit(
      characterRepository: _characterRepository,
    );

    expect(cubit.state.pagination.limit, _defaultLimit);
  });

  test('Set given pagination limit', () {
    final cubit = CharactersCubit(
      characterRepository: _characterRepository,
      limit: 172,
    );

    expect(cubit.state.pagination.limit, 172);
  });
}

void _loadTests() {
  blocTest(
    'Loads empty list of characters',
    build: () => _charactersCubit,
    act: (cubit) => cubit.load(),
    expect: () => [
      const CharactersState(actions: {CharactersAction.load}),
      const CharactersState(),
    ],
    verify: (_) {
      verify(
        () => _characterRepository.getCharacters(
          limit: _defaultLimit,
        ),
      ).called(1);
    },
  );

  group('Exception handling', _loadErrorTests);
  group('Load more', _loadMoreTests);
  group('Filtering', _loadFilterTests);
  group('Sorting', _loadSortTests);
  group('Filtering AND Sorting', _loadFilterAndSortTests);
}

void _loadErrorTests() {
  blocTest(
    'Throws invalid credentials',
    setUp: () {
      when(
        () => _characterRepository.getCharacters(
          filter: any(named: 'filter'),
          sort: any(named: 'sort'),
          limit: any(named: 'limit'),
          offset: any(named: 'offset'),
        ),
      ).thenThrow(
        const NetException(type: NetExceptionType.invalidCredentials),
      );
    },
    build: () => _charactersCubit,
    act: (cubit) => cubit.load(),
    expect: () => [
      const CharactersState(actions: {CharactersAction.load}),
      const CharactersState(errors: {CharactersErrors.invalidCredentials}),
    ],
  );

  blocTest(
    'Throws loading error with NetException',
    setUp: () {
      when(
        () => _characterRepository.getCharacters(
          filter: any(named: 'filter'),
          sort: any(named: 'sort'),
          limit: any(named: 'limit'),
          offset: any(named: 'offset'),
        ),
      ).thenThrow(
        const NetException(type: NetExceptionType.generic),
      );
    },
    build: () => _charactersCubit,
    act: (cubit) => cubit.load(),
    expect: () => [
      const CharactersState(actions: {CharactersAction.load}),
      const CharactersState(errors: {CharactersErrors.onLoading}),
    ],
  );

  blocTest(
    'Throws loading more error with generic exception',
    setUp: () {
      _pagination = const Pagination(
        offset: 0,
        limit: 10,
        total: 50,
      );

      when(
        () => _characterRepository.getCharacters(
          filter: any(named: 'filter'),
          sort: any(named: 'sort'),
          limit: any(named: 'limit'),
          offset: any(named: 'offset'),
        ),
      ).thenThrow(
        Exception(),
      );
    },
    seed: () => CharactersState(pagination: _pagination),
    build: () => _charactersCubit,
    act: (cubit) => cubit.load(
      loadMore: true,
    ),
    expect: () => [
      CharactersState(
        actions: {CharactersAction.loadMore},
        pagination: _pagination,
      ),
      CharactersState(
        errors: {CharactersErrors.onLoadingMore},
        pagination: _pagination,
      ),
    ],
  );
}

void _loadMoreTests() {
  setUp(() {
    when(
      () => _characterRepository.getCharacters(
        offset: _firstPagination.offset,
        limit: _firstPagination.limit,
      ),
    ).thenAnswer(
      (_) async => MarvelResult(
        items: _firstPageResults,
        attribution: const Attribution(),
        pagination: _firstPagination,
      ),
    );

    when(
      () => _characterRepository.getCharacters(
        offset: _secondPagination.offset,
        limit: _secondPagination.limit,
      ),
    ).thenAnswer(
      (_) async => MarvelResult(
        items: _secondPageResults,
        attribution: const Attribution(),
        pagination: _secondPagination,
      ),
    );
  });

  blocTest(
    'Loads first page of characters',
    build: () => _charactersCubit,
    act: (cubit) => cubit.load(),
    expect: () => [
      const CharactersState(actions: {CharactersAction.load}),
      CharactersState(
        items: _firstPageResults,
        pagination: _firstPagination,
      ),
    ],
    verify: (_) {
      verify(
        () => _characterRepository.getCharacters(
          offset: _firstPagination.offset,
          limit: _firstPagination.limit,
        ),
      ).called(1);
    },
  );

  blocTest(
    'Loads next page of characters',
    build: () => _charactersCubit,
    act: (cubit) => cubit.load(loadMore: true),
    seed: () => CharactersState(
      items: _firstPageResults,
      pagination: _firstPagination,
    ),
    expect: () => [
      CharactersState(
        actions: {CharactersAction.loadMore},
        items: _firstPageResults,
        pagination: _firstPagination,
      ),
      CharactersState(
        items: _characters,
        pagination: _secondPagination,
      ),
    ],
    verify: (_) {
      verify(
        () => _characterRepository.getCharacters(
          offset: _defaultLimit,
          limit: _defaultLimit,
        ),
      ).called(1);
    },
  );

  blocTest(
    'Ignore loading more if asked on the last page',
    build: () => _charactersCubit,
    seed: () => CharactersState(
      items: _secondPageResults,
      pagination: _secondPagination,
    ),
    act: (cubit) => cubit.load(loadMore: true),
    expect: () => [],
  );

  blocTest(
    'Reload first page if asked to load without more',
    build: () => _charactersCubit,
    seed: () => CharactersState(
      items: _secondPageResults,
      pagination: _secondPagination,
    ),
    act: (cubit) => cubit.load(loadMore: false),
    expect: () => [
      CharactersState(
        actions: {CharactersAction.load},
        items: _secondPageResults,
        pagination: _secondPagination,
      ),
      CharactersState(
        items: _firstPageResults,
        pagination: _firstPagination,
      ),
    ],
    verify: (_) {
      verify(
        () => _characterRepository.getCharacters(
          offset: _firstPagination.offset,
          limit: _firstPagination.limit,
        ),
      ).called(1);
    },
  );
}

void _loadFilterTests() {
  const filter = MarvelCharacterFilter(nameStartsWith: 'test');
  final filteredCharacters = _characters
      .where(
        (e) => e.id != 3 && e.id != 5,
      )
      .toList();

  final filterFirstPageResults =
      filteredCharacters.getRange(0, _defaultLimit).toList();
  final filterFirstPagination = Pagination(
    offset: 0,
    limit: _defaultLimit,
    total: filteredCharacters.length,
  );

  final filterSecondPageResults = filteredCharacters
      .getRange(_defaultLimit, filteredCharacters.length)
      .toList();
  final filterSecondPagination = Pagination(
    offset: _defaultLimit,
    limit: _defaultLimit,
    total: filteredCharacters.length,
  );

  setUp(() {
    when(
      () => _characterRepository.getCharacters(
        filter: const MarvelCharacterFilter(),
        offset: 0,
        limit: _defaultLimit,
      ),
    ).thenAnswer(
      (_) async => MarvelResult(
        items: _firstPageResults,
        attribution: const Attribution(),
        pagination: _firstPagination,
      ),
    );

    when(
      () => _characterRepository.getCharacters(
        filter: filter,
        offset: filterFirstPagination.offset,
        limit: filterFirstPagination.limit,
      ),
    ).thenAnswer(
      (_) async => MarvelResult(
        items: filterFirstPageResults,
        attribution: const Attribution(),
        pagination: filterFirstPagination,
      ),
    );

    when(
      () => _characterRepository.getCharacters(
        filter: filter,
        offset: filterSecondPagination.offset,
        limit: filterSecondPagination.limit,
      ),
    ).thenAnswer(
      (_) async => MarvelResult(
        items: filterSecondPageResults,
        attribution: const Attribution(),
        pagination: filterSecondPagination,
      ),
    );
  });

  blocTest(
    'Applies requested filter',
    build: () => _charactersCubit,
    act: (cubit) => cubit.load(
      filter: filter,
    ),
    expect: () => [
      const CharactersState(actions: {CharactersAction.load}),
      CharactersState(
        items: filterFirstPageResults,
        pagination: filterFirstPagination,
        filter: filter,
      ),
    ],
    verify: (_) {
      verify(
        () => _characterRepository.getCharacters(
          offset: filterFirstPagination.offset,
          limit: filterFirstPagination.limit,
          filter: filter,
        ),
      ).called(1);
    },
  );

  blocTest(
    'Applies requested filter on load more',
    build: () => _charactersCubit,
    act: (cubit) => cubit.load(
      loadMore: true,
    ),
    seed: () => CharactersState(
      items: filterFirstPageResults,
      pagination: filterFirstPagination,
      filter: filter,
    ),
    expect: () => [
      CharactersState(
        actions: {CharactersAction.loadMore},
        items: filterFirstPageResults,
        pagination: filterFirstPagination,
        filter: filter,
      ),
      CharactersState(
        items: filteredCharacters,
        pagination: filterSecondPagination,
        filter: filter,
      ),
    ],
    verify: (_) {
      verify(
        () => _characterRepository.getCharacters(
          offset: filterSecondPagination.offset,
          limit: filterSecondPagination.limit,
          filter: filter,
        ),
      ).called(1);
    },
  );

  blocTest(
    'Resets loading if filter changed',
    build: () => _charactersCubit,
    act: (cubit) => cubit.load(
      filter: const MarvelCharacterFilter(),
      loadMore: true,
    ),
    seed: () => CharactersState(
      items: filterSecondPageResults,
      pagination: filterSecondPagination,
      filter: filter,
    ),
    expect: () => [
      CharactersState(
        actions: {CharactersAction.load},
        items: filterSecondPageResults,
        pagination: filterSecondPagination,
        filter: filter,
      ),
      CharactersState(
        items: _firstPageResults,
        pagination: _firstPagination,
        filter: const MarvelCharacterFilter(),
      ),
    ],
    verify: (_) {
      verify(
        () => _characterRepository.getCharacters(
          offset: _firstPagination.offset,
          limit: _firstPagination.limit,
          filter: const MarvelCharacterFilter(),
        ),
      ).called(1);
    },
  );
}

void _loadSortTests() {
  final sort = {
    const SortField(
      field: MarvelCharacterSort.name,
    ),
  };

  final sortedCharacters = [..._characters]
    ..sort((a, b) => b.name.compareTo(a.name));

  final sortFirstPageResults =
      sortedCharacters.getRange(0, _defaultLimit).toList();
  final sortFirstPagination = Pagination(
    offset: 0,
    limit: _defaultLimit,
    total: sortedCharacters.length,
  );

  final sortSecondPageResults = sortedCharacters
      .getRange(_defaultLimit, sortedCharacters.length)
      .toList();
  final sortSecondPagination = Pagination(
    offset: _defaultLimit,
    limit: _defaultLimit,
    total: sortedCharacters.length,
  );

  setUp(() {
    when(
      () => _characterRepository.getCharacters(
        sort: {},
        offset: 0,
        limit: _defaultLimit,
      ),
    ).thenAnswer(
      (_) async => MarvelResult(
        items: _firstPageResults,
        attribution: const Attribution(),
        pagination: _firstPagination,
      ),
    );

    when(
      () => _characterRepository.getCharacters(
        sort: sort,
        offset: sortFirstPagination.offset,
        limit: sortFirstPagination.limit,
      ),
    ).thenAnswer(
      (_) async => MarvelResult(
        items: sortFirstPageResults,
        attribution: const Attribution(),
        pagination: sortFirstPagination,
      ),
    );

    when(
      () => _characterRepository.getCharacters(
        sort: sort,
        offset: sortSecondPagination.offset,
        limit: sortSecondPagination.limit,
      ),
    ).thenAnswer(
      (_) async => MarvelResult(
        items: sortSecondPageResults,
        attribution: const Attribution(),
        pagination: sortSecondPagination,
      ),
    );
  });

  blocTest(
    'Applies requested sorting',
    build: () => _charactersCubit,
    act: (cubit) => cubit.load(
      sort: sort,
    ),
    expect: () => [
      const CharactersState(actions: {CharactersAction.load}),
      CharactersState(
        items: sortFirstPageResults,
        pagination: sortFirstPagination,
        sort: sort,
      ),
    ],
    verify: (_) {
      verify(
        () => _characterRepository.getCharacters(
          offset: sortFirstPagination.offset,
          limit: sortFirstPagination.limit,
          sort: sort,
        ),
      ).called(1);
    },
  );

  blocTest(
    'Applies requested sorting on load more',
    build: () => _charactersCubit,
    act: (cubit) => cubit.load(
      loadMore: true,
    ),
    seed: () => CharactersState(
      items: sortFirstPageResults,
      pagination: sortFirstPagination,
      sort: sort,
    ),
    expect: () => [
      CharactersState(
        actions: {CharactersAction.loadMore},
        items: sortFirstPageResults,
        pagination: sortFirstPagination,
        sort: sort,
      ),
      CharactersState(
        items: sortedCharacters,
        pagination: sortSecondPagination,
        sort: sort,
      ),
    ],
    verify: (_) {
      verify(
        () => _characterRepository.getCharacters(
          offset: sortSecondPagination.offset,
          limit: sortSecondPagination.limit,
          sort: sort,
        ),
      ).called(1);
    },
  );

  blocTest(
    'Resets loading if sort changed',
    build: () => _charactersCubit,
    act: (cubit) => cubit.load(
      sort: {},
      loadMore: true,
    ),
    seed: () => CharactersState(
      items: sortSecondPageResults,
      pagination: sortSecondPagination,
      sort: sort,
    ),
    expect: () => [
      CharactersState(
        actions: {CharactersAction.load},
        items: sortSecondPageResults,
        pagination: sortSecondPagination,
        sort: sort,
      ),
      CharactersState(
        items: _firstPageResults,
        pagination: _firstPagination,
        sort: {},
      ),
    ],
    verify: (_) {
      verify(
        () => _characterRepository.getCharacters(
          offset: _firstPagination.offset,
          limit: _firstPagination.limit,
          sort: {},
        ),
      ).called(1);
    },
  );
}

void _loadFilterAndSortTests() {
  const filter = MarvelCharacterFilter(nameStartsWith: 'another test');
  final sort = {
    const SortField(
      field: MarvelCharacterSort.modified,
    ),
  };

  final filterSortCharacters = _characters
      .where(
        (e) => e.id != 6 && e.id != 7,
      )
      .toList()
    ..sort((a, b) => b.name.compareTo(a.name));

  final filterSortFirstPageResults =
      filterSortCharacters.getRange(0, _defaultLimit).toList();

  final filterSortFirstPagination = Pagination(
    offset: 0,
    limit: _defaultLimit,
    total: filterSortCharacters.length,
  );

  final filterSortSecondPageResults = filterSortCharacters
      .getRange(_defaultLimit, filterSortCharacters.length)
      .toList();

  final filterSortSecondPagination = Pagination(
    offset: _defaultLimit,
    limit: _defaultLimit,
    total: filterSortCharacters.length,
  );

  setUp(() {
    when(
      () => _characterRepository.getCharacters(
        filter: any(named: 'filter'),
        sort: any(named: 'sort'),
        offset: 0,
        limit: _defaultLimit,
      ),
    ).thenAnswer(
      (_) async => MarvelResult(
        items: _firstPageResults,
        attribution: const Attribution(),
        pagination: _firstPagination,
      ),
    );

    when(
      () => _characterRepository.getCharacters(
        filter: filter,
        sort: sort,
        offset: filterSortFirstPagination.offset,
        limit: filterSortFirstPagination.limit,
      ),
    ).thenAnswer(
      (_) async => MarvelResult(
        items: filterSortFirstPageResults,
        attribution: const Attribution(),
        pagination: filterSortFirstPagination,
      ),
    );

    when(
      () => _characterRepository.getCharacters(
        filter: filter,
        sort: sort,
        offset: filterSortSecondPagination.offset,
        limit: filterSortSecondPagination.limit,
      ),
    ).thenAnswer(
      (_) async => MarvelResult(
        items: filterSortSecondPageResults,
        attribution: const Attribution(),
        pagination: filterSortSecondPagination,
      ),
    );
  });

  blocTest(
    'Applies requested filter and sort',
    build: () => _charactersCubit,
    act: (cubit) => cubit.load(
      filter: filter,
      sort: sort,
    ),
    expect: () => [
      const CharactersState(actions: {CharactersAction.load}),
      CharactersState(
        items: filterSortFirstPageResults,
        pagination: filterSortFirstPagination,
        filter: filter,
        sort: sort,
      ),
    ],
    verify: (_) {
      verify(
        () => _characterRepository.getCharacters(
          offset: filterSortFirstPagination.offset,
          limit: filterSortFirstPagination.limit,
          filter: filter,
          sort: sort,
        ),
      ).called(1);
    },
  );

  blocTest(
    'Applies requested filter and sort on load more',
    build: () => _charactersCubit,
    act: (cubit) => cubit.load(
      loadMore: true,
    ),
    seed: () => CharactersState(
      items: filterSortFirstPageResults,
      pagination: filterSortFirstPagination,
      filter: filter,
      sort: sort,
    ),
    expect: () => [
      CharactersState(
        actions: {CharactersAction.loadMore},
        items: filterSortFirstPageResults,
        pagination: filterSortFirstPagination,
        filter: filter,
        sort: sort,
      ),
      CharactersState(
        items: filterSortCharacters,
        pagination: filterSortSecondPagination,
        filter: filter,
        sort: sort,
      ),
    ],
    verify: (_) {
      verify(
        () => _characterRepository.getCharacters(
          offset: filterSortSecondPagination.offset,
          limit: filterSortSecondPagination.limit,
          filter: filter,
          sort: sort,
        ),
      ).called(1);
    },
  );

  blocTest(
    'Resets loading if filter changed',
    build: () => _charactersCubit,
    act: (cubit) => cubit.load(
      filter: const MarvelCharacterFilter(),
      loadMore: true,
    ),
    seed: () => CharactersState(
      items: filterSortSecondPageResults,
      pagination: filterSortSecondPagination,
      filter: filter,
      sort: sort,
    ),
    expect: () => [
      CharactersState(
        actions: {CharactersAction.load},
        items: filterSortSecondPageResults,
        pagination: filterSortSecondPagination,
        filter: filter,
        sort: sort,
      ),
      CharactersState(
        items: _firstPageResults,
        pagination: _firstPagination,
        filter: const MarvelCharacterFilter(),
        sort: sort,
      ),
    ],
    verify: (_) {
      verify(
        () => _characterRepository.getCharacters(
          offset: _firstPagination.offset,
          limit: _firstPagination.limit,
          filter: const MarvelCharacterFilter(),
          sort: sort,
        ),
      ).called(1);
    },
  );

  blocTest(
    'Resets loading if sort changed',
    build: () => _charactersCubit,
    act: (cubit) => cubit.load(
      sort: {},
      loadMore: true,
    ),
    seed: () => CharactersState(
      items: filterSortSecondPageResults,
      pagination: filterSortSecondPagination,
      filter: filter,
      sort: sort,
    ),
    expect: () => [
      CharactersState(
        actions: {CharactersAction.load},
        items: filterSortSecondPageResults,
        pagination: filterSortSecondPagination,
        filter: filter,
        sort: sort,
      ),
      CharactersState(
        items: _firstPageResults,
        pagination: _firstPagination,
        filter: filter,
        sort: {},
      ),
    ],
    verify: (_) {
      verify(
        () => _characterRepository.getCharacters(
          offset: _firstPagination.offset,
          limit: _firstPagination.limit,
          filter: filter,
          sort: {},
        ),
      ).called(1);
    },
  );

  blocTest(
    'Resets loading if both filter and sort have changed',
    build: () => _charactersCubit,
    act: (cubit) => cubit.load(
      filter: const MarvelCharacterFilter(),
      sort: {},
      loadMore: true,
    ),
    seed: () => CharactersState(
      items: filterSortSecondPageResults,
      pagination: filterSortSecondPagination,
      filter: filter,
      sort: sort,
    ),
    expect: () => [
      CharactersState(
        actions: {CharactersAction.load},
        items: filterSortSecondPageResults,
        pagination: filterSortSecondPagination,
        filter: filter,
        sort: sort,
      ),
      CharactersState(
        items: _firstPageResults,
        pagination: _firstPagination,
        filter: const MarvelCharacterFilter(),
        sort: {},
      ),
    ],
    verify: (_) {
      verify(
        () => _characterRepository.getCharacters(
          offset: _firstPagination.offset,
          limit: _firstPagination.limit,
          filter: const MarvelCharacterFilter(),
          sort: {},
        ),
      ).called(1);
    },
  );
}
