import 'package:flutter/cupertino.dart';

class Person with ChangeNotifier {
  int age = 1;

  void changAge() {
    age += 1;
    notifyListeners();
  }
}
