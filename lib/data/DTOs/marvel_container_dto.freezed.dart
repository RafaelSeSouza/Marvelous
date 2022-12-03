// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'marvel_container_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MarvelContainerDTO<T> _$MarvelContainerDTOFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _MarvelContainerDTO<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$MarvelContainerDTO<T> {
  List<T> get results => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarvelContainerDTOCopyWith<T, MarvelContainerDTO<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarvelContainerDTOCopyWith<T, $Res> {
  factory $MarvelContainerDTOCopyWith(MarvelContainerDTO<T> value,
          $Res Function(MarvelContainerDTO<T>) then) =
      _$MarvelContainerDTOCopyWithImpl<T, $Res, MarvelContainerDTO<T>>;
  @useResult
  $Res call({List<T> results, int offset, int limit, int total, int count});
}

/// @nodoc
class _$MarvelContainerDTOCopyWithImpl<T, $Res,
        $Val extends MarvelContainerDTO<T>>
    implements $MarvelContainerDTOCopyWith<T, $Res> {
  _$MarvelContainerDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? offset = null,
    Object? limit = null,
    Object? total = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<T>,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MarvelContainerDTOCopyWith<T, $Res>
    implements $MarvelContainerDTOCopyWith<T, $Res> {
  factory _$$_MarvelContainerDTOCopyWith(_$_MarvelContainerDTO<T> value,
          $Res Function(_$_MarvelContainerDTO<T>) then) =
      __$$_MarvelContainerDTOCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({List<T> results, int offset, int limit, int total, int count});
}

/// @nodoc
class __$$_MarvelContainerDTOCopyWithImpl<T, $Res>
    extends _$MarvelContainerDTOCopyWithImpl<T, $Res, _$_MarvelContainerDTO<T>>
    implements _$$_MarvelContainerDTOCopyWith<T, $Res> {
  __$$_MarvelContainerDTOCopyWithImpl(_$_MarvelContainerDTO<T> _value,
      $Res Function(_$_MarvelContainerDTO<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? offset = null,
    Object? limit = null,
    Object? total = null,
    Object? count = null,
  }) {
    return _then(_$_MarvelContainerDTO<T>(
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<T>,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$_MarvelContainerDTO<T> implements _MarvelContainerDTO<T> {
  const _$_MarvelContainerDTO(
      {required final List<T> results,
      required this.offset,
      required this.limit,
      required this.total,
      required this.count})
      : _results = results;

  factory _$_MarvelContainerDTO.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$_MarvelContainerDTOFromJson(json, fromJsonT);

  final List<T> _results;
  @override
  List<T> get results {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  final int offset;
  @override
  final int limit;
  @override
  final int total;
  @override
  final int count;

  @override
  String toString() {
    return 'MarvelContainerDTO<$T>(results: $results, offset: $offset, limit: $limit, total: $total, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MarvelContainerDTO<T> &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_results),
      offset,
      limit,
      total,
      count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MarvelContainerDTOCopyWith<T, _$_MarvelContainerDTO<T>> get copyWith =>
      __$$_MarvelContainerDTOCopyWithImpl<T, _$_MarvelContainerDTO<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$_MarvelContainerDTOToJson<T>(this, toJsonT);
  }
}

abstract class _MarvelContainerDTO<T> implements MarvelContainerDTO<T> {
  const factory _MarvelContainerDTO(
      {required final List<T> results,
      required final int offset,
      required final int limit,
      required final int total,
      required final int count}) = _$_MarvelContainerDTO<T>;

  factory _MarvelContainerDTO.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$_MarvelContainerDTO<T>.fromJson;

  @override
  List<T> get results;
  @override
  int get offset;
  @override
  int get limit;
  @override
  int get total;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$_MarvelContainerDTOCopyWith<T, _$_MarvelContainerDTO<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
