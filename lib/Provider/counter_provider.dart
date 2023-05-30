import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int counter = 0;
  void increment(value) {
    ///+++
    counter++;
    notifyListeners();
  }
}

class SelectedProvider extends ChangeNotifier {
  int selected = 0;
  selected1(value) {
    ///+++
    selected = value;
    notifyListeners();
  }
}
