import 'package:flutter/cupertino.dart';

class CountNotifier extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }
}
