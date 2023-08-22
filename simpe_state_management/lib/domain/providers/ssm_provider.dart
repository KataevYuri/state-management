import 'package:flutter/material.dart';

class CounterInCart with ChangeNotifier {
  int value = 0;

  void increment() {
    value++;
    notifyListeners();
  }
}
