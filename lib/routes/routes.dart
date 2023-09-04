import 'package:flutter/material.dart';
import 'package:mfa/pages/home.dart';
import 'package:mfa/pages/login.dart';

final Map<String, WidgetBuilder> routes = {
  "/": (context) => const HomePage(), //注册首页路由
  "login": (context) => const LoginPage(),
};
