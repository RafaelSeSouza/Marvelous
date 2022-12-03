// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'characters_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CharactersState {
  Set<CharactersAction> get actions => throw _privateConstructorUsedError;
  Set<CharactersErrors> get errors => throw _privateConstructorUsedError;
  List<MarvelCharacter> get items => throw _privateConstructorUsedError;
  Pagination get pagination => throw _privateConstructorUsedError;
  MarvelCharacterFilter? get filter => throw _privateConstructorUsedError;
  Set<SortField<MarvelCharacterSort>>? get sort =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CharactersStateCopyWith<CharactersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharactersStateCopyWith<$Res> {
  factory $CharactersStateCopyWith(
          CharactersState value, $Res Function(CharactersState) then) =
      _$CharactersStateCopyWithImpl<$Res, CharactersState>;
  @useResult
  $Res call(
      {Set<CharactersAction> actions,
      Set<CharactersErrors> errors,
      List<MarvelCharacter> items,
      Pagination pagination,
      MarvelCharacterFilter? filter,
      Set<SortField<MarvelCharacterSort>>? sort});

  $PaginationCopyWith<$Res> get pagination;
  $MarvelCharacterFilterCopyWith<$Res>? get filter;
}

/// @nodoc
class _$CharactersStateCopyWithImpl<$Res, $Val extends CharactersState>
    implements $CharactersStateCopyWith<$Res> {
  _$CharactersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actions = null,
    Object? errors = null,
    Object? items = null,
    Object? pagination = null,
    Object? filter = freezed,
    Object? sort = freezed,
  }) {
    return _then(_value.copyWith(
      actions: null == actions
          ? _value.actions
          : actions // ignore: cast_nullable_to_non_nullable
              as Set<CharactersAction>,
      errors: null == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Set<CharactersErrors>,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MarvelCharacter>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
      filter: freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as MarvelCharacterFilter?,
      sort: freezed == sort
          ? _value.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as Set<SortField<MarvelCharacterSort>>?,
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
  $MarvelCharacterFilterCopyWith<$Res>? get filter {
    if (_value.filter == null) {
      return null;
    }

    return $MarvelCharacterFilterCopyWith<$Res>(_value.filter!, (value) {
      return _then(_value.copyWith(filter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CharactersStateCopyWith<$Res>
    implements $CharactersStateCopyWith<$Res> {
  factory _$$_CharactersStateCopyWith(
          _$_CharactersState value, $Res Function(_$_CharactersState) then) =
      __$$_CharactersStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Set<CharactersAction> actions,
      Set<CharactersErrors> errors,
      List<MarvelCharacter> items,
      Pagination pagination,
      MarvelCharacterFilter? filter,
      Set<SortField<MarvelCharacterSort>>? sort});

  @override
  $PaginationCopyWith<$Res> get pagination;
  @override
  $MarvelCharacterFilterCopyWith<$Res>? get filter;
}

/// @nodoc
class __$$_CharactersStateCopyWithImpl<$Res>
    extends _$CharactersStateCopyWithImpl<$Res, _$_CharactersState>
    implements _$$_CharactersStateCopyWith<$Res> {
  __$$_CharactersStateCopyWithImpl(
      _$_CharactersState _value, $Res Function(_$_CharactersState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? actions = null,
    Object? errors = null,
    Object? items = null,
    Object? pagination = null,
    Object? filter = freezed,
    Object? sort = freezed,
  }) {
    return _then(_$_CharactersState(
      actions: null == actions
          ? _value._actions
          : actions // ignore: cast_nullable_to_non_nullable
              as Set<CharactersAction>,
      errors: null == errors
          ? _value._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as Set<CharactersErrors>,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MarvelCharacter>,
      pagination: null == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination,
      filter: freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as MarvelCharacterFilter?,
      sort: freezed == sort
          ? _value._sort
          : sort // ignore: cast_nullable_to_non_nullable
              as Set<SortField<MarvelCharacterSort>>?,
    ));
  }
}

/// @nodoc

class _$_CharactersState extends _CharactersState {
  const _$_CharactersState(
      {final Set<CharactersAction> actions = const {},
      final Set<CharactersErrors> errors = const {},
      final List<MarvelCharacter> items = const [],
      this.pagination = const Pagination(),
      this.filter,
      final Set<SortField<MarvelCharacterSort>>? sort})
      : _actions = actions,
        _errors = errors,
        _items = items,
        _sort = sort,
        super._();

  final Set<CharactersAction> _actions;
  @override
  @JsonKey()
  Set<CharactersAction> get actions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_actions);
  }

  final Set<CharactersErrors> _errors;
  @override
  @JsonKey()
  Set<CharactersErrors> get errors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_errors);
  }

  final List<MarvelCharacter> _items;
  @override
  @JsonKey()
  List<MarvelCharacter> get items {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final Pagination pagination;
  @override
  final MarvelCharacterFilter? filter;
  final Set<SortField<MarvelCharacterSort>>? _sort;
  @override
  Set<SortField<MarvelCharacterSort>>? get sort {
    final value = _sort;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(value);
  }

  @override
  String toString() {
    return 'CharactersState(actions: $actions, errors: $errors, items: $items, pagination: $pagination, filter: $filter, sort: $sort)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CharactersState &&
            const DeepCollectionEquality().equals(other._actions, _actions) &&
            const DeepCollectionEquality().equals(other._errors, _errors) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            const DeepCollectionEquality().equals(other._sort, _sort));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_actions),
      const DeepCollectionEquality().hash(_errors),
      const DeepCollectionEquality().hash(_items),
      pagination,
      filter,
      const DeepCollectionEquality().hash(_sort));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CharactersStateCopyWith<_$_CharactersState> get copyWith =>
      __$$_CharactersStateCopyWithImpl<_$_CharactersState>(this, _$identity);
}

abstract class _CharactersState extends CharactersState {
  const factory _CharactersState(
      {final Set<CharactersAction> actions,
      final Set<CharactersErrors> errors,
      final List<MarvelCharacter> items,
      final Pagination pagination,
      final MarvelCharacterFilter? filter,
      final Set<SortField<MarvelCharacterSort>>? sort}) = _$_CharactersState;
  const _CharactersState._() : super._();

  @override
  Set<CharactersAction> get actions;
  @override
  Set<CharactersErrors> get errors;
  @override
  List<MarvelCharacter> get items;
  @override
  Pagination get pagination;
  @override
  MarvelCharacterFilter? get filter;
  @override
  Set<SortField<MarvelCharacterSort>>? get sort;
  @override
  @JsonKey(ignore: true)
  _$$_CharactersStateCopyWith<_$_CharactersState> get copyWith =>
      throw _privateConstructorUsedError;
}
