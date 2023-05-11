import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:musicday_mobile/core/logging/logger.dart';
import 'package:musicday_mobile/core/logging/logger_factory.dart';
import 'package:musicday_mobile/core/paging/paged_response_impl.dart';
import 'package:musicday_mobile/core/paging/paged_response_state.dart';
import 'package:rxdart/rxdart.dart';
import 'paged_response_impl_test.mocks.dart';

@GenerateMocks([LoggerFactory, Logger])
void main() {
  final loggerFactory = MockLoggerFactory();
  when(loggerFactory.create(any)).thenReturn(MockLogger());

  test("If server not returning answer during part loading, pager waits response", () async {
    final response = PagedResponseImpl<int>(
        pageSize: 2, loggerFactory: loggerFactory, getPartItemsStream: (size, offset) => const Stream.empty());

    final stream = response.state.shareReplay()..listen((event) {});
    await response.loadMore();

    final future = Future(() => stream.toList());
    await response.dispose();
    expect(await future, [const PagedResponseState<int>(items: [], isLoading: true)]);
  });

  test("If page loading started & completed, new states returns in stream", () async {
    final response = PagedResponseImpl<int>(
        pageSize: 2, loggerFactory: loggerFactory, getPartItemsStream: (size, offset) => Stream.value([1, 2]));

    final stream = response.state.shareReplay()..listen((event) {});
    await response.loadMore();

    final future = Future(() => stream.toList());
    await response.dispose();
    expect(await future, [
      const PagedResponseState<int>(items: [], isLoading: true),
      const PagedResponseState<int>(items: [1, 2], isLoading: false)
    ]);
  });

  test("If server returning final page during part loading, next requests ignoring", () async {
    final response = PagedResponseImpl<int>(
        pageSize: 2, loggerFactory: loggerFactory, getPartItemsStream: (size, offset) => Stream.value([1]));

    final stream = response.state.shareReplay()..listen((event) {});
    await response.loadMore();

    // Ждем второй эвент ...
    // Это будет эвент об окончании загрузки первой страницы
    await stream.take(2).last;

    // Теперь попробуем загрузить следующую страницу.
    await response.loadMore();

    final future = Future(() => stream.toList());
    await response.dispose();
    expect(await future, [
      const PagedResponseState<int>(items: [], isLoading: true),
      const PagedResponseState<int>(items: [1], isLoading: false)
    ]);
  });

  test("If server request already doing & user requests next page, request ignored", () async {
    final partStream = StreamController<List<int>>.broadcast();
    final response = PagedResponseImpl<int>(
        pageSize: 2, loggerFactory: loggerFactory, getPartItemsStream: (size, offset) => partStream.stream);

    final stream = response.state.shareReplay()..listen((event) {});
    await response.loadMore();
    await response.loadMore();

    // Отвечаем на первый запрос.
    partStream.add([1, 2]);

    // Следующий запрос не должен быть запущен.
    final future = Future(() => stream.toList());
    await response.dispose();
    expect(await future, [
      const PagedResponseState<int>(items: [], isLoading: true),
      const PagedResponseState<int>(items: [1, 2], isLoading: false)
    ]);
  });
}
