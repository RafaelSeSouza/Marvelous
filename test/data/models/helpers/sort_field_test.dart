import 'package:flutter_test/flutter_test.dart';
import 'package:marvelous/data/models/helpers/sort_field.dart';

enum TestSortField {
  primary,
  secondary,
  tertiary,
}

void main() {
  group('SortField creation tests', _creationTests);
  group('Sort field format tests', _formatTests);
  group('SortField set extension tests', _setFormatTests);
}

void _creationTests() {
  test('Creates with correct field and ascending value', () {
    var sortField = const SortField<TestSortField>(
      field: TestSortField.secondary,
      ascending: false,
    );

    expect(sortField.field, TestSortField.secondary);
    expect(sortField.ascending, false);
  });

  test('SortField has ascending = true by default', () {
    var sortField = const SortField<TestSortField>(
      field: TestSortField.primary,
    );

    expect(sortField.ascending, true);
  });
}

void _formatTests() {
  test('Ascending format test', () {
    var sortField = const SortField<TestSortField>(
      field: TestSortField.secondary,
      ascending: true,
    );

    expect(sortField.format(), 'secondary');
  });

  test('Descending format test', () {
    var sortField = const SortField<TestSortField>(
      field: TestSortField.tertiary,
      ascending: false,
    );

    expect(sortField.format(), '-tertiary');
  });
}

void _setFormatTests() {
  test('Formats set of SortFields', () {
    final set = {
      const SortField<TestSortField>(
        field: TestSortField.primary,
        ascending: false,
      ),
      const SortField<TestSortField>(
        field: TestSortField.tertiary,
        ascending: true,
      ),
    };

    expect(set.format(), '-primary,tertiary');
  });
}
