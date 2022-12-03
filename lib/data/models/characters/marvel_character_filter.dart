import 'package:freezed_annotation/freezed_annotation.dart';

part 'marvel_character_filter.freezed.dart';

/// Holds the data to filter a list of Marvel characters.
@freezed
class MarvelCharacterFilter with _$MarvelCharacterFilter {
  const factory MarvelCharacterFilter({
    @Default('') String name,
    @Default('') String nameStartsWith,
    DateTime? modifiedSince,
    @Default([]) List<int> comics,
    @Default([]) List<int> series,
    @Default([]) List<int> events,
    @Default([]) List<int> stories,
  }) = _MarvelCharacterFilter;
}
