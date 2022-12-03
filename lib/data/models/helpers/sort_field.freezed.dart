// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sort_field.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SortField<T extends Enum> {
  T get field => throw _privateConstructorUsedError;
  bool get ascending => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SortFieldCopyWith<T, SortField<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SortFieldCopyWith<T extends Enum, $Res> {
  factory $SortFieldCopyWith(
          SortField<T> value, $Res Function(SortField<T>) then) =
      _$SortFieldCopyWithImpl<T, $Res, SortField<T>>;
  @useResult
  $Res call({T field, bool ascending});
}

/// @nodoc
class _$SortFieldCopyWithImpl<T extends Enum, $Res, $Val extends SortField<T>>
    implements $SortFieldCopyWith<T, $Res> {
  _$SortFieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = null,
    Object? ascending = null,
  }) {
    return _then(_value.copyWith(
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as T,
      ascending: null == ascending
          ? _value.ascending
          : ascending // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SortFieldCopyWith<T extends Enum, $Res>
    implements $SortFieldCopyWith<T, $Res> {
  factory _$$_SortFieldCopyWith(
          _$_SortField<T> value, $Res Function(_$_SortField<T>) then) =
      __$$_SortFieldCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T field, bool ascending});
}

/// @nodoc
class __$$_SortFieldCopyWithImpl<T extends Enum, $Res>
    extends _$SortFieldCopyWithImpl<T, $Res, _$_SortField<T>>
    implements _$$_SortFieldCopyWith<T, $Res> {
  __$$_SortFieldCopyWithImpl(
      _$_SortField<T> _value, $Res Function(_$_SortField<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? field = null,
    Object? ascending = null,
  }) {
    return _then(_$_SortField<T>(
      field: null == field
          ? _value.field
          : field // ignore: cast_nullable_to_non_nullable
              as T,
      ascending: null == ascending
          ? _value.ascending
          : ascending // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_SortField<T extends Enum> extends _SortField<T> {
  const _$_SortField({required this.field, this.ascending = true}) : super._();

  @override
  final T field;
  @override
  @JsonKey()
  final bool ascending;

  @override
  String toString() {
    return 'SortField<$T>(field: $field, ascending: $ascending)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SortField<T> &&
            const DeepCollectionEquality().equals(other.field, field) &&
            (identical(other.ascending, ascending) ||
                other.ascending == ascending));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(field), ascending);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SortFieldCopyWith<T, _$_SortField<T>> get copyWith =>
      __$$_SortFieldCopyWithImpl<T, _$_SortField<T>>(this, _$identity);
}

abstract class _SortField<T extends Enum> extends SortField<T> {
  const factory _SortField({required final T field, final bool ascending}) =
      _$_SortField<T>;
  const _SortField._() : super._();

  @override
  T get field;
  @override
  bool get ascending;
  @override
  @JsonKey(ignore: true)
  _$$_SortFieldCopyWith<T, _$_SortField<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
