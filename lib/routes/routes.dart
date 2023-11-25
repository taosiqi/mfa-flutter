import 'package:flutter/material.dart';
import 'package:mfa/pages/demo/day.dart';
import 'package:mfa/pages/demo/dialog.dart';
import 'package:mfa/pages/demo/form.dart';
import 'package:mfa/pages/demo/list.dart';
import 'package:mfa/pages/demo/other.dart';
import 'package:mfa/pages/demo/provider.dart';
import 'package:mfa/pages/demo/view.dart';
import 'package:mfa/pages/home.dart';
import 'package:mfa/pages/login.dart';

final Map<String, WidgetBuilder> routes = {
  "/": (context) => const HomePage(), //注册首页路由
  'provider': (context) => const ProvidePage(),
  'dialog': (context) => const DialogPage(),
  'form': (context) => FormPage(),
  'viewPage': (context) => const ViewPage(),
  'other': (context) => const OtherPage(),
  'day': (context) => DayPage(),
  'list': (context) => const ListPage(),
  "login": (context) => const LoginPage(),
};
