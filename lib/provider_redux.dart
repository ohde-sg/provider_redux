library provider_redux;

import 'package:flutter/foundation.dart';

class Reducer<Action, T extends Store> {
  Function(Action, T) reducer;
  Reducer({this.reducer});
  call(dynamic action, T store) {
    if (action is Action) {
      return reducer(action, store);
    }
    return null;
  }
}

class Store with ChangeNotifier {
  List<Reducer> reducers;

  dispatch(dynamic action) {
    reducers.forEach((t) => t.call(action, this));
    this.notifyListeners();
  }
}
