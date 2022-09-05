import 'package:flutter/material.dart';

class CounterState with ChangeNotifier {
  int counter = 0;

  void increment() {
    counter = counter + 1;
    notifyListeners();
  }

  void decrement() {
    counter = counter - 1;
    notifyListeners();
  }
}
