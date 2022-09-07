import 'dart:async';

import 'counter_events.dart';

class CounterModel {
  int _counter = 0;

  // ========================
  // model access
  // ========================
  final _counterStateController = StreamController<int>();

  // input
  StreamSink<int> get _inCounter => _counterStateController.sink;
  // output
  Stream<int> get counter => _counterStateController.stream;

  // ========================
  // input actions
  // ========================
  final _counterEventController = StreamController<CounterEvent>();
  Sink<CounterEvent> get counterEventSync => _counterEventController.sink;

  CounterModel() {
    // listen from events and map to model mutations
    _counterEventController.stream.listen(_mapEvent);
  }

  // map event to model mutation
  void _mapEvent(CounterEvent event) {
    if (event is IncrementEvent) {
      _counter++;
    } else {
      _counter--;
    }

    _inCounter.add(_counter);
  }

  void dispose() {
    _counterEventController.close();
    _counterStateController.close();
  }
}
