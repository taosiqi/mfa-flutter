import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String _token = '666';

  String get token => _token;

  void setToken(String token) {
    _token = token;
    notifyListeners();
  }

// ... 其他用户相关的方法
}
