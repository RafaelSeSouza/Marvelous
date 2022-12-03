import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'marvel_image.freezed.dart';
part 'marvel_image.g.dart';

enum MarvelImageAspect {
  portrait('portrait'),
  standard('standard'),
  landscape('landscape'),
  detail('detail'),
  fullSize('');

  final String name;

  const MarvelImageAspect(this.name);
}

enum MarvelImageSize {
  none(''),
  small('small'),
  medium('medium'),
  large('large'),
  amazing('amazing'),
  xlarge('xlarge'),
  fantastic('fantastic'),
  incredible('incredible'),
  uncanny('uncanny');

  final String name;

  const MarvelImageSize(this.name);
}

/// Creates the correct URLs to fetch images from the Marvel Comics API, based
/// on their path and extension.
@freezed
class MarvelImage with _$MarvelImage {
  /// The available image variants, taken from
  /// `https://developer.marvel.com/documentation/images`
  static const variants = {
    MarvelImageAspect.portrait: <MarvelImageSize, Size>{
      MarvelImageSize.small: Size(50.0, 75.0),
      MarvelImageSize.medium: Size(100.0, 150.0),
      MarvelImageSize.xlarge: Size(150.0, 225.0),
      MarvelImageSize.fantastic: Size(168.0, 252.0),
      MarvelImageSize.uncanny: Size(300.0, 450.0),
      MarvelImageSize.incredible: Size(216.0, 324.0),
    },
    MarvelImageAspect.standard: {
      MarvelImageSize.small: Size(65.0, 45.0),
      MarvelImageSize.medium: Size(100.0, 100.0),
      MarvelImageSize.large: Size(140.0, 140.0),
      MarvelImageSize.xlarge: Size(200.0, 200.0),
      MarvelImageSize.fantastic: Size(250.0, 250.0),
      MarvelImageSize.amazing: Size(180.0, 180.0),
    },
    MarvelImageAspect.landscape: {
      MarvelImageSize.small: Size(120.0, 90.0),
      MarvelImageSize.medium: Size(175.0, 130.0),
      MarvelImageSize.large: Size(190.0, 140.0),
      MarvelImageSize.xlarge: Size(270.0, 200.0),
      MarvelImageSize.amazing: Size(250.0, 156.0),
      MarvelImageSize.incredible: Size(464.0, 261.0),
    },
    MarvelImageAspect.detail: {
      MarvelImageSize.none: Size(500.0, double.maxFinite),
    },
    MarvelImageAspect.fullSize: {
      MarvelImageSize.none: Size(double.maxFinite, double.maxFinite),
    }
  };

  const MarvelImage._();

  const factory MarvelImage({
    required String path,
    required String extension,
  }) = _MarvelImage;

  factory MarvelImage.fromJson(Map<String, dynamic> json) =>
      _$MarvelImageFromJson(json);

  /// Creates the URL from the given [aspect] and [size].
  ///
  /// Throws an [ArgumentError] if the [aspect] does not support [size].
  String url({
    required MarvelImageAspect aspect,
    required MarvelImageSize size,
  }) {
    if (!(variants[aspect]?.containsKey(size) ?? false)) {
      throw ArgumentError.value(
        size,
        '$aspect',
        'Aspect $aspect does not support size $size',
      );
    }

    final suffix = '${aspect.name}'
            '${size != MarvelImageSize.none ? '_${size.name}' : ''}'
        .trim();

    return suffix.isEmpty ? path : '$path/$suffix.$extension';
  }

  /// Creates the URL for the given combination of [aspect] and [width]/[height]
  ///
  /// To work, it needs at least a [width] or a [height], or both.
  ///
  /// It iterates through all the available [variants], and selects the most
  /// suitable size.
  ///
  /// This method works even if the [variants]'s sizes are not ordered from
  /// smallest to biggest.
  String urlToFit({
    required MarvelImageAspect aspect,
    double? width,
    double? height,
  }) {
    assert(width != null || height != null);

    final sizes = variants[aspect]?.entries ?? [];
    MapEntry<MarvelImageSize, Size>? current;
    MapEntry<MarvelImageSize, Size>? maximum;

    for (final element in sizes) {
      if (current == null ||
          (element.value.width > current.value.width ||
              element.value.height > current.value.height)) {
        maximum = element;
      }

      final validWidth = width == null ||
          (width <= element.value.width &&
              (current == null || element.value.width < current.value.width));

      final validHeight = height == null ||
          (height <= element.value.height &&
              (current == null || element.value.height < current.value.height));

      if (validWidth && validHeight) current = element;
    }

    assert(maximum != null, 'Variant for this aspect has no sizes.');

    return url(
      aspect: aspect,
      size: current?.key ?? maximum!.key,
    );
  }
}
