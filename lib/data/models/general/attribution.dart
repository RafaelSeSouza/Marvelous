import 'package:freezed_annotation/freezed_annotation.dart';

part 'attribution.freezed.dart';

/// Holds the Marvel copyright data.
@freezed
class Attribution with _$Attribution {
  const factory Attribution({
    @Default('') String copyright,
    @Default('') String text,
    @Default('') String html,
  }) = _Attribution;
}
