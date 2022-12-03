import 'package:flutter_test/flutter_test.dart';
import 'package:marvelous/data/models/general/pagination.dart';

void main() {
  group('Pagination creation tests', _paginationCreationTests);
  group('Forward pagination tests', _forwardPaginationTests);
  group('Backward pagination tests', _backwardPaginationTests);
}

void _paginationCreationTests() {
  test(
    'Creates pagination with default values',
    () {
      const pagination = Pagination();

      expect(pagination.offset, 0);
      expect(pagination.limit, 10);
      expect(pagination.total, 0);
    },
  );

  test(
    'Creates pagination with given values',
    () {
      const pagination = Pagination(
        offset: 2,
        limit: 5,
        total: 17,
      );

      expect(pagination.offset, 2);
      expect(pagination.limit, 5);
      expect(pagination.total, 17);
    },
  );
}

void _forwardPaginationTests() {
  test(
    'Returns that there is a next page available',
    () {
      const pagination = Pagination(
        total: 22,
      );

      expect(pagination.hasNextPage, true);
    },
  );

  test(
    'Returns offset for next page',
    () {
      const pagination = Pagination(
        offset: 2,
        limit: 5,
        total: 22,
      );

      expect(pagination.nextOffset, 7);
    },
  );

  test(
    'Returns that there is not a next page',
    () {
      const pagination = Pagination(
        total: 5,
      );

      expect(pagination.hasNextPage, false);
    },
  );

  test(
    'Throws when trying to get the offset of the next page when on last page',
    () {
      const pagination = Pagination(
        total: 3,
      );

      expect(
        () => pagination.nextOffset,
        throwsA(isA<NoNextPageException>()),
      );
    },
  );
}

void _backwardPaginationTests() {
  test(
    'Returns that there is a previous page available',
    () {
      const pagination = Pagination(
        offset: 30,
        total: 100,
      );

      expect(pagination.hasPreviousPage, true);
    },
  );

  test(
    'Returns offset for previous page',
    () {
      const pagination = Pagination(
        offset: 35,
        limit: 5,
        total: 100,
      );

      expect(pagination.previousOffset, 30);
    },
  );

  test(
    'Returns that there is not a previous page',
    () {
      const pagination = Pagination(
        total: 80,
      );

      expect(pagination.hasPreviousPage, false);
    },
  );

  test(
    'Throws when trying to get the offset of the '
    'previous page when on first page',
    () {
      const pagination = Pagination(
        total: 32,
      );

      expect(
        () => pagination.previousOffset,
        throwsA(isA<NoPreviousPageException>()),
      );
    },
  );
}
