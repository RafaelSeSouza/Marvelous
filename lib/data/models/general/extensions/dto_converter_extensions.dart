import 'package:marvelous/data/DTOs/marvel_container_dto.dart';

import '../../../DTOs/marvel_wrapper_dto.dart';
import '../attribution.dart';
import '../marvel_result.dart';
import '../pagination.dart';

/// Transforms the DTOs (data transfer objects) into our app's internal models.
extension MarvelWrapperDTOConverter<T>
    on MarvelWrapperDTO<MarvelContainerDTO<T>> {
  MarvelResult<T> toResult() => MarvelResult<T>(
        items: data.results,
        pagination: toPagination(),
        attribution: toAttribution(),
        tag: eTag,
      );

  Pagination toPagination() => Pagination(
        offset: data.offset,
        limit: data.limit,
        total: data.total,
      );

  Attribution toAttribution() => Attribution(
        copyright: copyright,
        text: attributionText,
        html: attributionHTML,
      );
}
