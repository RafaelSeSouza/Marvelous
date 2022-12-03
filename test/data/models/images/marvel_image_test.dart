import 'package:flutter_test/flutter_test.dart';
import 'package:marvelous/data/models/images/marvel_image.dart';

const _testPath = 'http://marvelimagetest.com/mg/uuid289173';
const _testExtension = 'png';
var _marvelImage = const MarvelImage(
  path: _testPath,
  extension: _testExtension,
);

void main() {
  group('URL generation tests', _urlTests);
  group('URL to fit tests', () {
    group('Single variant', _urlToFitSingleVariantTests);
    group('Fit to given size', _urlToFitSizeTests);
  });
}

void _urlTests() {
  test('Should generate URL for variant that has single size', () {
    expect(
      _marvelImage.url(
        aspect: MarvelImageAspect.detail,
        size: MarvelImageSize.none,
      ),
      '$_testPath/${MarvelImageAspect.detail.name}.$_testExtension',
    );
  });

  test('Should generate URL for variant that has different sizes', () {
    expect(
      _marvelImage.url(
        aspect: MarvelImageAspect.portrait,
        size: MarvelImageSize.medium,
      ),
      '$_testPath/${MarvelImageAspect.portrait.name}_${MarvelImageSize.medium.name}.$_testExtension',
    );
  });

  test('Should throw in invalid aspect/size combination', () {
    expect(
      () => _marvelImage.url(
        aspect: MarvelImageAspect.standard,
        size: MarvelImageSize.uncanny,
      ),
      throwsA(isA<ArgumentError>()),
    );
  });
}

void _urlToFitSingleVariantTests() {
  test('Without suffix', () {
    expect(
      _marvelImage.urlToFit(
        aspect: MarvelImageAspect.fullSize,
        height: 10.0,
        width: 10.0,
      ),
      _testPath,
    );
  });

  test('With suffix', () {
    expect(
      _marvelImage.urlToFit(
        aspect: MarvelImageAspect.detail,
        height: 1000.0,
      ),
      '$_testPath/${MarvelImageAspect.detail.name}.$_testExtension',
    );
  });
}

void _urlToFitSizeTests() {
  test('Correct URL for given width', () {
    expect(
      _marvelImage.urlToFit(
        aspect: MarvelImageAspect.landscape,
        width: 190.0,
      ),
      '$_testPath/${MarvelImageAspect.landscape.name}_${MarvelImageSize.large.name}.$_testExtension',
      reason: 'Should select landscape large',
    );

    expect(
      _marvelImage.urlToFit(
        aspect: MarvelImageAspect.landscape,
        width: 191.0,
      ),
      '$_testPath/${MarvelImageAspect.landscape.name}_${MarvelImageSize.amazing.name}.$_testExtension',
      reason: 'Should select landscape amazing',
    );

    expect(
      _marvelImage.urlToFit(
        aspect: MarvelImageAspect.landscape,
        width: 270.0,
      ),
      '$_testPath/${MarvelImageAspect.landscape.name}_${MarvelImageSize.xlarge.name}.$_testExtension',
      reason: 'Should select landscape extra large',
    );
  });

  test('Correct URL for given height', () {
    expect(
      _marvelImage.urlToFit(
        aspect: MarvelImageAspect.portrait,
        height: 324.0,
      ),
      '$_testPath/${MarvelImageAspect.portrait.name}_${MarvelImageSize.incredible.name}.$_testExtension',
      reason: 'Should select portrait incredible',
    );

    expect(
      _marvelImage.urlToFit(
        aspect: MarvelImageAspect.portrait,
        height: 252.0,
      ),
      '$_testPath/${MarvelImageAspect.portrait.name}_${MarvelImageSize.fantastic.name}.$_testExtension',
      reason: 'Should select portrait fantastic',
    );

    expect(
      _marvelImage.urlToFit(
        aspect: MarvelImageAspect.portrait,
        height: 325.0,
      ),
      '$_testPath/${MarvelImageAspect.portrait.name}_${MarvelImageSize.uncanny.name}.$_testExtension',
      reason: 'Should select portrait uncanny',
    );
  });

  test('Correct URL for given width AND height', () {
    expect(
      _marvelImage.urlToFit(
        aspect: MarvelImageAspect.portrait,
        width: 168.0,
        height: 252.0,
      ),
      '$_testPath/${MarvelImageAspect.portrait.name}_${MarvelImageSize.fantastic.name}.$_testExtension',
      reason: 'Should select portrait fantastic',
    );

    expect(
      _marvelImage.urlToFit(
        aspect: MarvelImageAspect.portrait,
        width: 168.0,
        height: 252.5,
      ),
      '$_testPath/${MarvelImageAspect.portrait.name}_${MarvelImageSize.incredible.name}.$_testExtension',
      reason: 'Should select portrait incredible based on height',
    );

    expect(
      _marvelImage.urlToFit(
        aspect: MarvelImageAspect.portrait,
        width: 168.5,
        height: 252.0,
      ),
      '$_testPath/${MarvelImageAspect.portrait.name}_${MarvelImageSize.incredible.name}.$_testExtension',
      reason: 'Should select portrait incredible based on width',
    );

    expect(
      _marvelImage.urlToFit(
        aspect: MarvelImageAspect.portrait,
        width: 300.0,
        height: 300.0,
      ),
      '$_testPath/${MarvelImageAspect.portrait.name}_${MarvelImageSize.uncanny.name}.$_testExtension',
      reason: 'Should select portrait uncanny',
    );
  });

  test('Should generate URL for all available variants', () {
    for (final variant in MarvelImage.variants.entries) {
      final aspect = variant.key;

      for (final sizeData in variant.value.entries) {
        final imageSize = sizeData.key;
        final size = sizeData.value;

        final suffix = '${aspect.name}'
                '${imageSize != MarvelImageSize.none ? '_${imageSize.name}' : ''}'
            .trim();

        expect(
          _marvelImage.urlToFit(
            aspect: aspect,
            width: size.width,
            height: size.height,
          ),
          suffix.isEmpty ? _testPath : '$_testPath/$suffix.$_testExtension',
          reason: 'Should select $aspect $imageSize',
        );
      }
    }
  });
}
