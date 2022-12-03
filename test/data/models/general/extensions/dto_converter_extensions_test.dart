import 'package:flutter_test/flutter_test.dart';
import 'package:marvelous/data/DTOs/marvel_container_dto.dart';
import 'package:marvelous/data/DTOs/marvel_wrapper_dto.dart';
import 'package:marvelous/data/models/general/attribution.dart';
import 'package:marvelous/data/models/general/extensions/dto_converter_extensions.dart';
import 'package:marvelous/data/models/general/marvel_result.dart';
import 'package:marvelous/data/models/general/pagination.dart';
import 'package:mocktail/mocktail.dart';

class MockContainer<T> extends Mock implements MarvelContainerDTO<T> {}

class MockWrapper<T extends MarvelContainerDTO> extends Mock
    implements MarvelWrapperDTO<T> {}

void main() {
  test('DTO to Pagination model', _testPaginationConversion);
  test('DTO to Attribution model', _testAttributionConversion);
  test('Full DTO to MarvelResult model', _marvelResultConversion);
}

void _testPaginationConversion() {
  final container = MockContainer<int>();
  final wrapper = MockWrapper<MockContainer<int>>();

  when(() => wrapper.data).thenReturn(container);
  when(() => container.offset).thenReturn(3);
  when(() => container.limit).thenReturn(5);
  when(() => container.total).thenReturn(17);

  final pagination = wrapper.toPagination();

  expect(pagination.offset, 3);
  expect(pagination.limit, 5);
  expect(pagination.total, 17);
}

void _testAttributionConversion() {
  final wrapper = MockWrapper<MockContainer<int>>();

  when(() => wrapper.copyright).thenReturn('Copyright notice');
  when(() => wrapper.attributionText).thenReturn('Attribution text');
  when(() => wrapper.attributionHTML).thenReturn('Attribution... in HTML!');

  final attribution = wrapper.toAttribution();

  expect(attribution.copyright, 'Copyright notice');
  expect(attribution.text, 'Attribution text');
  expect(attribution.html, 'Attribution... in HTML!');
}

void _marvelResultConversion() {
  final container = MockContainer<int>();
  final wrapper = MockWrapper<MockContainer<int>>();

  var target = const MarvelResult<int>(
    items: [1, 3, 5, 6],
    pagination: Pagination(
      offset: 3,
      limit: 15,
      total: 4,
    ),
    attribution: Attribution(
      copyright: 'Copyright (C) 2022',
      text: 'By Marvel',
      html: '<B>Marvel</B>',
    ),
    tag: 'e29jdsis1282fjsijd',
  );

  when(() => container.results).thenReturn(target.items);
  when(() => container.offset).thenReturn(target.pagination.offset);
  when(() => container.limit).thenReturn(target.pagination.limit);
  when(() => container.total).thenReturn(target.items.length);

  when(() => wrapper.code).thenReturn(200);
  when(() => wrapper.status).thenReturn('Ok');
  when(() => wrapper.data).thenReturn(container);
  when(() => wrapper.eTag).thenReturn(target.tag);
  when(() => wrapper.copyright).thenReturn(target.attribution.copyright);
  when(() => wrapper.attributionText).thenReturn(target.attribution.text);
  when(() => wrapper.attributionHTML).thenReturn(target.attribution.html);

  expect(wrapper.toResult(), target);
}
