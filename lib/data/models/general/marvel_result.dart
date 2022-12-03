import 'package:freezed_annotation/freezed_annotation.dart';

import 'attribution.dart';
import 'pagination.dart';

part 'marvel_result.freezed.dart';

/// Holds the transformed data for the result of a Marvel API call.
///
/// It differs from the wrapper and container DTOs as this data is already
/// transformed to be easier to use by the app.
@freezed
class MarvelResult<T> with _$MarvelResult<T> {
  const factory MarvelResult({
    required List<T> items,
    required Pagination pagination,
    required Attribution attribution,
    @Default('') String tag,
  }) = _MarvelResult;
}
