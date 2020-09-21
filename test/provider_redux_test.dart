import 'package:flutter_test/flutter_test.dart';
import 'package:provider_redux/provider_redux.dart';

void main() {
  test('test increment action', () {
    final store = MyStore();
    store.addListener(() {
      expect(store.count, equals(1));
    });
    store.dispatch(IncrementAction());
  });

  test('test decrement action', () {
    final store = MyStore();
    store.addListener(() {
      expect(store.count, equals(-1));
    });
    store.dispatch(DecrementAction());
  });
}

class IncrementAction {}

class DecrementAction {}

class MyStore extends Store {
  int count = 0;
  List<Reducer> reducers = [
    Reducer<IncrementAction, MyStore>(reducer: (action, store) {
      store.count++;
    }),
    Reducer<DecrementAction, MyStore>(reducer: (action, store) {
      store.count--;
    })
  ];
}
