import 'package:flutter/material.dart';
import 'package:mfa/pages/entry/entry.dart';
import 'package:mfa/pages/entry/scan.dart';
import 'package:mfa/pages/export/after.dart';
import 'package:mfa/pages/export/code.dart';
import 'package:mfa/pages/export/export.dart';
import 'package:mfa/pages/home.dart';
import 'package:mfa/pages/import/guide.dart';
import 'package:mfa/pages/import/import.dart';
import 'package:mfa/pages/import/offline.dart';
import 'package:mfa/pages/login.dart';
import 'package:mfa/pages/poster.dart';
import 'package:mfa/pages/setting/privacy.dart';
import 'package:mfa/pages/setting/setting.dart';

final Map<String, WidgetBuilder> routes = {
  "/": (context) => const HomePage(), //注册首页路由
  "login": (context) => const LoginPage(),
  "entry": (context) => const EntryPage(),
  "scan": (context) => const ScanPage(),
  "export": (context) => const ExportPage(),
  "code": (context) => const CodePage(),
  "after": (context) => const AfterPage(),
  "import": (context) => const ImportPage(),
  "guide": (context) => const GuidePage(),
  "offline": (context) => const OfflinePage(),
  "setting": (context) => const SettingPage(),
  "privacy": (context) => const PrivacyPage(),
  "poster": (context) => const PosterPage(),
};
