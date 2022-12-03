// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'marvel_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MarvelResult<T> {
  List<T> get items => throw _privateConstructorUsedError;
  Pagination get pagination => throw _privateConstructorUsedError;
  Attribution get attribution => throw _privateConstructorUsedError;
  String get tag => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MarvelResultCopyWith<T, MarvelResult<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarvelResultCopyWith<T, $Res> {
  factory $MarvelResultCopyWith(
          MarvelResult<T> value, $Res Function(MarvelResult<T>) then) =
      _$MarvelResultCopyWithImpl<T, $Res, MarvelResult<T>>;
  @useResult
  $Res call(
      {List<T> items,
      Pagination pagination,
      Attribution attribution,
      String tag});

  $PaginationCopyWith<$Res> get pagination;
  $AttributionCopyWith<$Res> get attribution;
}

/// @nodoc
class _$MarvelResultCopyWithImpl<T, $Res, $Val extends MarvelResult<T>>
    implements $MarvelResultCopyWith<T, $Res> {
  _$MarvelResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? pagination = null,
    Object? attribution = null,
    Object? tag = null,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
      attribution: null == attribution
          ? _value.attribution
          : attribution // ignore: cast_nullable_to_non_nullable
              as Attribution,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaginationCopyWith<$Res> get pagination {
    return $PaginationCopyWith<$Res>(_value.pagination, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AttributionCopyWith<$Res> get attribution {
    return $AttributionCopyWith<$Res>(_value.attribution, (value) {
      return _then(_value.copyWith(attribution: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MarvelResultCopyWith<T, $Res>
    implements $MarvelResultCopyWith<T, $Res> {
  factory _$$_MarvelResultCopyWith(
          _$_MarvelResult<T> value, $Res Function(_$_MarvelResult<T>) then) =
      __$$_MarvelResultCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {List<T> items,
      Pagination pagination,
      Attribution attribution,
      String tag});

  @override
  $PaginationCopyWith<$Res> get pagination;
  @override
  $AttributionCopyWith<$Res> get attribution;
}

/// @nodoc
class __$$_MarvelResultCopyWithImpl<T, $Res>
    extends _$MarvelResultCopyWithImpl<T, $Res, _$_MarvelResult<T>>
    implements _$$_MarvelResultCopyWith<T, $Res> {
  __$$_MarvelResultCopyWithImpl(
      _$_MarvelResult<T> _value, $Res Function(_$_MarvelResult<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? pagination = null,
    Object? attribution = null,
    Object? tag = null,
  }) {
    return _then(_$_MarvelResult<T>(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<T>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
      attribution: null == attribution
          ? _value.attribution
          : attribution // ignore: cast_nullable_to_non_nullable
              as Attribution,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_MarvelResult<T> implements _MarvelResult<T> {
  const _$_MarvelResult(
      {required final List<T> items,
      required this.pagination,
      required this.attribution,
      this.tag = ''})
      : _items = items;

  final List<T> _items;
  @override
  List<T> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final Pagination pagination;
  @override
  final Attribution attribution;
  @override
  @JsonKey()
  final String tag;

  @override
  String toString() {
    return 'MarvelResult<$T>(items: $items, pagination: $pagination, attribution: $attribution, tag: $tag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MarvelResult<T> &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination) &&
            (identical(other.attribution, attribution) ||
                other.attribution == attribution) &&
            (identical(other.tag, tag) || other.tag == tag));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      pagination,
      attribution,
      tag);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MarvelResultCopyWith<T, _$_MarvelResult<T>> get copyWith =>
      __$$_MarvelResultCopyWithImpl<T, _$_MarvelResult<T>>(this, _$identity);
}

abstract class _MarvelResult<T> implements MarvelResult<T> {
  const factory _MarvelResult(
      {required final List<T> items,
      required final Pagination pagination,
      required final Attribution attribution,
      final String tag}) = _$_MarvelResult<T>;

  @override
  List<T> get items;
  @override
  Pagination get pagination;
  @override
  Attribution get attribution;
  @override
  String get tag;
  @override
  @JsonKey(ignore: true)
  _$$_MarvelResultCopyWith<T, _$_MarvelResult<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
