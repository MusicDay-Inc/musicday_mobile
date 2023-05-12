import 'dart:async';

import 'package:musicday_mobile/core/logging/logger.dart';
import 'package:musicday_mobile/core/logging/logger_factory.dart';
import 'package:musicday_mobile/core/paging/paged_response.dart';
import 'package:musicday_mobile/core/paging/paged_response_event.dart';
import 'package:musicday_mobile/core/paging/paged_response_state.dart';
import 'package:rxdart/rxdart.dart';

class PagedResponseImpl<T> implements PagedResponse<T> {
  late StreamSubscription _subscription;

  final _eventsController = StreamController<PagedResponseEvent>.broadcast();
  final _stateController = ReplaySubject<PagedResponseState<T>>(maxSize: 1);
  final Stream<List<T>> Function(int size, int offset) getPartItemsStream;
  final Logger _logger;

  @override
  Stream<PagedResponseState<T>> get state => _stateController.stream;

  PagedResponseImpl({
    required int pageSize,
    required LoggerFactory loggerFactory,
    required this.getPartItemsStream,
  }) : _logger = loggerFactory.create("PagedResponseImpl") {
    _logger.debug("constructor");

    var currentState = PagedResponseState<T>(isLoading: false, items: []);
    _subscription = _eventsController.stream
        .where((event) => !currentState.isLoading && currentState.items.length % pageSize == 0)
        .doOnData((event) => currentState = currentState.copyWith(isLoading: true))
        .doOnData((event) => _stateController.add(currentState))
        .switchMap((event) => getPartItemsStream(pageSize, currentState.items.length))
        .doOnData((event) => currentState = currentState.copyWith(isLoading: false, items: currentState.items + event))
        .doOnData((event) => _stateController.add(currentState))
        .listen((event) {});
  }

  @override
  Future<void> loadMore() async {
    _eventsController.add(const PagedResponseEvent.loadMore());
  }

  @override
  Future<void> dispose() async {
    _logger.debug("dispose()");
    await _eventsController.close();
    await _stateController.close();
    await _subscription.cancel();
  }
}
