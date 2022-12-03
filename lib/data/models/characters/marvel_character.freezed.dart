// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'marvel_character.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MarvelCharacter _$MarvelCharacterFromJson(Map<String, dynamic> json) {
  return _MarvelCharacter.fromJson(json);
}

/// @nodoc
mixin _$MarvelCharacter {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  MarvelImage get thumbnail => throw _privateConstructorUsedError;
  DateTime get modified => throw _privateConstructorUsedError;
  String get resourceURI => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarvelCharacterCopyWith<MarvelCharacter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarvelCharacterCopyWith<$Res> {
  factory $MarvelCharacterCopyWith(
          MarvelCharacter value, $Res Function(MarvelCharacter) then) =
      _$MarvelCharacterCopyWithImpl<$Res, MarvelCharacter>;
  @useResult
  $Res call(
      {int id,
      String name,
      MarvelImage thumbnail,
      DateTime modified,
      String resourceURI});

  $MarvelImageCopyWith<$Res> get thumbnail;
}

/// @nodoc
class _$MarvelCharacterCopyWithImpl<$Res, $Val extends MarvelCharacter>
    implements $MarvelCharacterCopyWith<$Res> {
  _$MarvelCharacterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? thumbnail = null,
    Object? modified = null,
    Object? resourceURI = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as MarvelImage,
      modified: null == modified
          ? _value.modified
          : modified // ignore: cast_nullable_to_non_nullable
              as DateTime,
      resourceURI: null == resourceURI
          ? _value.resourceURI
          : resourceURI // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MarvelImageCopyWith<$Res> get thumbnail {
    return $MarvelImageCopyWith<$Res>(_value.thumbnail, (value) {
      return _then(_value.copyWith(thumbnail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MarvelCharacterCopyWith<$Res>
    implements $MarvelCharacterCopyWith<$Res> {
  factory _$$_MarvelCharacterCopyWith(
          _$_MarvelCharacter value, $Res Function(_$_MarvelCharacter) then) =
      __$$_MarvelCharacterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      MarvelImage thumbnail,
      DateTime modified,
      String resourceURI});

  @override
  $MarvelImageCopyWith<$Res> get thumbnail;
}

/// @nodoc
class __$$_MarvelCharacterCopyWithImpl<$Res>
    extends _$MarvelCharacterCopyWithImpl<$Res, _$_MarvelCharacter>
    implements _$$_MarvelCharacterCopyWith<$Res> {
  __$$_MarvelCharacterCopyWithImpl(
      _$_MarvelCharacter _value, $Res Function(_$_MarvelCharacter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? thumbnail = null,
    Object? modified = null,
    Object? resourceURI = null,
  }) {
    return _then(_$_MarvelCharacter(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as MarvelImage,
      modified: null == modified
          ? _value.modified
          : modified // ignore: cast_nullable_to_non_nullable
              as DateTime,
      resourceURI: null == resourceURI
          ? _value.resourceURI
          : resourceURI // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MarvelCharacter implements _MarvelCharacter {
  const _$_MarvelCharacter(
      {required this.id,
      required this.name,
      required this.thumbnail,
      required this.modified,
      required this.resourceURI});

  factory _$_MarvelCharacter.fromJson(Map<String, dynamic> json) =>
      _$$_MarvelCharacterFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final MarvelImage thumbnail;
  @override
  final DateTime modified;
  @override
  final String resourceURI;

  @override
  String toString() {
    return 'MarvelCharacter(id: $id, name: $name, thumbnail: $thumbnail, modified: $modified, resourceURI: $resourceURI)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MarvelCharacter &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.modified, modified) ||
                other.modified == modified) &&
            (identical(other.resourceURI, resourceURI) ||
                other.resourceURI == resourceURI));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, thumbnail, modified, resourceURI);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MarvelCharacterCopyWith<_$_MarvelCharacter> get copyWith =>
      __$$_MarvelCharacterCopyWithImpl<_$_MarvelCharacter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MarvelCharacterToJson(
      this,
    );
  }
}

abstract class _MarvelCharacter implements MarvelCharacter {
  const factory _MarvelCharacter(
      {required final int id,
      required final String name,
      required final MarvelImage thumbnail,
      required final DateTime modified,
      required final String resourceURI}) = _$_MarvelCharacter;

  factory _MarvelCharacter.fromJson(Map<String, dynamic> json) =
      _$_MarvelCharacter.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  MarvelImage get thumbnail;
  @override
  DateTime get modified;
  @override
  String get resourceURI;
  @override
  @JsonKey(ignore: true)
  _$$_MarvelCharacterCopyWith<_$_MarvelCharacter> get copyWith =>
      throw _privateConstructorUsedError;
}
