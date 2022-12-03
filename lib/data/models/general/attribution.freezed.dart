// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'attribution.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Attribution {
  String get copyright => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get html => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AttributionCopyWith<Attribution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttributionCopyWith<$Res> {
  factory $AttributionCopyWith(
          Attribution value, $Res Function(Attribution) then) =
      _$AttributionCopyWithImpl<$Res, Attribution>;
  @useResult
  $Res call({String copyright, String text, String html});
}

/// @nodoc
class _$AttributionCopyWithImpl<$Res, $Val extends Attribution>
    implements $AttributionCopyWith<$Res> {
  _$AttributionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? copyright = null,
    Object? text = null,
    Object? html = null,
  }) {
    return _then(_value.copyWith(
      copyright: null == copyright
          ? _value.copyright
          : copyright // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      html: null == html
          ? _value.html
          : html // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AttributionCopyWith<$Res>
    implements $AttributionCopyWith<$Res> {
  factory _$$_AttributionCopyWith(
          _$_Attribution value, $Res Function(_$_Attribution) then) =
      __$$_AttributionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String copyright, String text, String html});
}

/// @nodoc
class __$$_AttributionCopyWithImpl<$Res>
    extends _$AttributionCopyWithImpl<$Res, _$_Attribution>
    implements _$$_AttributionCopyWith<$Res> {
  __$$_AttributionCopyWithImpl(
      _$_Attribution _value, $Res Function(_$_Attribution) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? copyright = null,
    Object? text = null,
    Object? html = null,
  }) {
    return _then(_$_Attribution(
      copyright: null == copyright
          ? _value.copyright
          : copyright // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      html: null == html
          ? _value.html
          : html // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Attribution implements _Attribution {
  const _$_Attribution({this.copyright = '', this.text = '', this.html = ''});

  @override
  @JsonKey()
  final String copyright;
  @override
  @JsonKey()
  final String text;
  @override
  @JsonKey()
  final String html;

  @override
  String toString() {
    return 'Attribution(copyright: $copyright, text: $text, html: $html)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Attribution &&
            (identical(other.copyright, copyright) ||
                other.copyright == copyright) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.html, html) || other.html == html));
  }

  @override
  int get hashCode => Object.hash(runtimeType, copyright, text, html);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AttributionCopyWith<_$_Attribution> get copyWith =>
      __$$_AttributionCopyWithImpl<_$_Attribution>(this, _$identity);
}

abstract class _Attribution implements Attribution {
  const factory _Attribution(
      {final String copyright,
      final String text,
      final String html}) = _$_Attribution;

  @override
  String get copyright;
  @override
  String get text;
  @override
  String get html;
  @override
  @JsonKey(ignore: true)
  _$$_AttributionCopyWith<_$_Attribution> get copyWith =>
      throw _privateConstructorUsedError;
}
