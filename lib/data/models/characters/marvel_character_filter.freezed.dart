// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'marvel_character_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MarvelCharacterFilter {
  String get name => throw _privateConstructorUsedError;
  String get nameStartsWith => throw _privateConstructorUsedError;
  DateTime? get modifiedSince => throw _privateConstructorUsedError;
  List<int> get comics => throw _privateConstructorUsedError;
  List<int> get series => throw _privateConstructorUsedError;
  List<int> get events => throw _privateConstructorUsedError;
  List<int> get stories => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MarvelCharacterFilterCopyWith<MarvelCharacterFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarvelCharacterFilterCopyWith<$Res> {
  factory $MarvelCharacterFilterCopyWith(MarvelCharacterFilter value,
          $Res Function(MarvelCharacterFilter) then) =
      _$MarvelCharacterFilterCopyWithImpl<$Res, MarvelCharacterFilter>;
  @useResult
  $Res call(
      {String name,
      String nameStartsWith,
      DateTime? modifiedSince,
      List<int> comics,
      List<int> series,
      List<int> events,
      List<int> stories});
}

/// @nodoc
class _$MarvelCharacterFilterCopyWithImpl<$Res,
        $Val extends MarvelCharacterFilter>
    implements $MarvelCharacterFilterCopyWith<$Res> {
  _$MarvelCharacterFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? nameStartsWith = null,
    Object? modifiedSince = freezed,
    Object? comics = null,
    Object? series = null,
    Object? events = null,
    Object? stories = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nameStartsWith: null == nameStartsWith
          ? _value.nameStartsWith
          : nameStartsWith // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedSince: freezed == modifiedSince
          ? _value.modifiedSince
          : modifiedSince // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      comics: null == comics
          ? _value.comics
          : comics // ignore: cast_nullable_to_non_nullable
              as List<int>,
      series: null == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as List<int>,
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<int>,
      stories: null == stories
          ? _value.stories
          : stories // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MarvelCharacterFilterCopyWith<$Res>
    implements $MarvelCharacterFilterCopyWith<$Res> {
  factory _$$_MarvelCharacterFilterCopyWith(_$_MarvelCharacterFilter value,
          $Res Function(_$_MarvelCharacterFilter) then) =
      __$$_MarvelCharacterFilterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String nameStartsWith,
      DateTime? modifiedSince,
      List<int> comics,
      List<int> series,
      List<int> events,
      List<int> stories});
}

/// @nodoc
class __$$_MarvelCharacterFilterCopyWithImpl<$Res>
    extends _$MarvelCharacterFilterCopyWithImpl<$Res, _$_MarvelCharacterFilter>
    implements _$$_MarvelCharacterFilterCopyWith<$Res> {
  __$$_MarvelCharacterFilterCopyWithImpl(_$_MarvelCharacterFilter _value,
      $Res Function(_$_MarvelCharacterFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? nameStartsWith = null,
    Object? modifiedSince = freezed,
    Object? comics = null,
    Object? series = null,
    Object? events = null,
    Object? stories = null,
  }) {
    return _then(_$_MarvelCharacterFilter(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nameStartsWith: null == nameStartsWith
          ? _value.nameStartsWith
          : nameStartsWith // ignore: cast_nullable_to_non_nullable
              as String,
      modifiedSince: freezed == modifiedSince
          ? _value.modifiedSince
          : modifiedSince // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      comics: null == comics
          ? _value._comics
          : comics // ignore: cast_nullable_to_non_nullable
              as List<int>,
      series: null == series
          ? _value._series
          : series // ignore: cast_nullable_to_non_nullable
              as List<int>,
      events: null == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<int>,
      stories: null == stories
          ? _value._stories
          : stories // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$_MarvelCharacterFilter implements _MarvelCharacterFilter {
  const _$_MarvelCharacterFilter(
      {this.name = '',
      this.nameStartsWith = '',
      this.modifiedSince,
      final List<int> comics = const [],
      final List<int> series = const [],
      final List<int> events = const [],
      final List<int> stories = const []})
      : _comics = comics,
        _series = series,
        _events = events,
        _stories = stories;

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String nameStartsWith;
  @override
  final DateTime? modifiedSince;
  final List<int> _comics;
  @override
  @JsonKey()
  List<int> get comics {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comics);
  }

  final List<int> _series;
  @override
  @JsonKey()
  List<int> get series {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_series);
  }

  final List<int> _events;
  @override
  @JsonKey()
  List<int> get events {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_events);
  }

  final List<int> _stories;
  @override
  @JsonKey()
  List<int> get stories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stories);
  }

  @override
  String toString() {
    return 'MarvelCharacterFilter(name: $name, nameStartsWith: $nameStartsWith, modifiedSince: $modifiedSince, comics: $comics, series: $series, events: $events, stories: $stories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MarvelCharacterFilter &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameStartsWith, nameStartsWith) ||
                other.nameStartsWith == nameStartsWith) &&
            (identical(other.modifiedSince, modifiedSince) ||
                other.modifiedSince == modifiedSince) &&
            const DeepCollectionEquality().equals(other._comics, _comics) &&
            const DeepCollectionEquality().equals(other._series, _series) &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            const DeepCollectionEquality().equals(other._stories, _stories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      nameStartsWith,
      modifiedSince,
      const DeepCollectionEquality().hash(_comics),
      const DeepCollectionEquality().hash(_series),
      const DeepCollectionEquality().hash(_events),
      const DeepCollectionEquality().hash(_stories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MarvelCharacterFilterCopyWith<_$_MarvelCharacterFilter> get copyWith =>
      __$$_MarvelCharacterFilterCopyWithImpl<_$_MarvelCharacterFilter>(
          this, _$identity);
}

abstract class _MarvelCharacterFilter implements MarvelCharacterFilter {
  const factory _MarvelCharacterFilter(
      {final String name,
      final String nameStartsWith,
      final DateTime? modifiedSince,
      final List<int> comics,
      final List<int> series,
      final List<int> events,
      final List<int> stories}) = _$_MarvelCharacterFilter;

  @override
  String get name;
  @override
  String get nameStartsWith;
  @override
  DateTime? get modifiedSince;
  @override
  List<int> get comics;
  @override
  List<int> get series;
  @override
  List<int> get events;
  @override
  List<int> get stories;
  @override
  @JsonKey(ignore: true)
  _$$_MarvelCharacterFilterCopyWith<_$_MarvelCharacterFilter> get copyWith =>
      throw _privateConstructorUsedError;
}
