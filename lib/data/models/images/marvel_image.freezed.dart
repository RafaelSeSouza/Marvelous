// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'marvel_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MarvelImage _$MarvelImageFromJson(Map<String, dynamic> json) {
  return _MarvelImage.fromJson(json);
}

/// @nodoc
mixin _$MarvelImage {
  String get path => throw _privateConstructorUsedError;
  String get extension => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarvelImageCopyWith<MarvelImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarvelImageCopyWith<$Res> {
  factory $MarvelImageCopyWith(
          MarvelImage value, $Res Function(MarvelImage) then) =
      _$MarvelImageCopyWithImpl<$Res, MarvelImage>;
  @useResult
  $Res call({String path, String extension});
}

/// @nodoc
class _$MarvelImageCopyWithImpl<$Res, $Val extends MarvelImage>
    implements $MarvelImageCopyWith<$Res> {
  _$MarvelImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? extension = null,
  }) {
    return _then(_value.copyWith(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      extension: null == extension
          ? _value.extension
          : extension // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MarvelImageCopyWith<$Res>
    implements $MarvelImageCopyWith<$Res> {
  factory _$$_MarvelImageCopyWith(
          _$_MarvelImage value, $Res Function(_$_MarvelImage) then) =
      __$$_MarvelImageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String path, String extension});
}

/// @nodoc
class __$$_MarvelImageCopyWithImpl<$Res>
    extends _$MarvelImageCopyWithImpl<$Res, _$_MarvelImage>
    implements _$$_MarvelImageCopyWith<$Res> {
  __$$_MarvelImageCopyWithImpl(
      _$_MarvelImage _value, $Res Function(_$_MarvelImage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? extension = null,
  }) {
    return _then(_$_MarvelImage(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      extension: null == extension
          ? _value.extension
          : extension // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MarvelImage extends _MarvelImage {
  const _$_MarvelImage({required this.path, required this.extension})
      : super._();

  factory _$_MarvelImage.fromJson(Map<String, dynamic> json) =>
      _$$_MarvelImageFromJson(json);

  @override
  final String path;
  @override
  final String extension;

  @override
  String toString() {
    return 'MarvelImage(path: $path, extension: $extension)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MarvelImage &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.extension, extension) ||
                other.extension == extension));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, path, extension);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MarvelImageCopyWith<_$_MarvelImage> get copyWith =>
      __$$_MarvelImageCopyWithImpl<_$_MarvelImage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MarvelImageToJson(
      this,
    );
  }
}

abstract class _MarvelImage extends MarvelImage {
  const factory _MarvelImage(
      {required final String path,
      required final String extension}) = _$_MarvelImage;
  const _MarvelImage._() : super._();

  factory _MarvelImage.fromJson(Map<String, dynamic> json) =
      _$_MarvelImage.fromJson;

  @override
  String get path;
  @override
  String get extension;
  @override
  @JsonKey(ignore: true)
  _$$_MarvelImageCopyWith<_$_MarvelImage> get copyWith =>
      throw _privateConstructorUsedError;
}
