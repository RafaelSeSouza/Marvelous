import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.freezed.dart';

/// Base class for pagination exceptions.
abstract class PaginationException implements Exception {}

/// Thrown when a next page is requested on a pagination object, but it is
/// already on the last page.
class NoNextPageException implements PaginationException {}

/// Thrown when a previous page is requested on a pagination object, but it is
/// already on the first page.
class NoPreviousPageException implements PaginationException {}

/// Holds the basic data for pagination, with some helper methods to facilitate
/// it.
@freezed
class Pagination with _$Pagination {
  const Pagination._();

  const factory Pagination({
    @Default(0) int offset,
    @Default(10) int limit,
    @Default(0) int total,
  }) = _Pagination;

  /// Returns `true` if there's a next page available.
  bool get hasNextPage => offset + limit < total;

  /// Returns `true` if there's a previous page available.
  bool get hasPreviousPage => offset > 0;

  /// Returns the offset for the next page.
  ///
  /// Throws [NoNextPageException] if already on the last page.
  int get nextOffset {
    if (!hasNextPage) throw NoNextPageException();

    return offset + limit;
  }

  /// Returns the offset for the previous page.
  ///
  /// Throws [NoPreviousPageException] if already on the last page.
  int get previousOffset {
    if (!hasPreviousPage) throw NoPreviousPageException();

    return max(offset - limit, 0);
  }
}
