import 'package:freezed_annotation/freezed_annotation.dart';

part 'sort_field.freezed.dart';

/// Helps in setting sorting fields when querying the backend.
///
/// It keeps the field to sort based on an enum, and if the sorting should be
/// ascending or descending.
///
/// It has a convenience [format] method that transforms the data into a string
/// that is accepted by the Marvel Comics API.
@Freezed(genericArgumentFactories: true)
class SortField<T extends Enum> with _$SortField<T> {
  const SortField._();

  const factory SortField({
    required T field,
    @Default(true) bool ascending,
  }) = _SortField;

  String format() => '${ascending ? '' : '-'}${field.name}';
}

/// Helper extension that formats a set of [SortField]s.
extension SortFieldSetExtension on Set<SortField> {
  String format() => map((e) => e.format()).join(',');
}
