import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mfa/pages/demo/adaptive.dart';
import 'package:mfa/pages/demo/day.dart';
import 'package:mfa/pages/demo/device.dart';
import 'package:mfa/pages/demo/dialog.dart';
import 'package:mfa/pages/demo/form.dart';
import 'package:mfa/pages/demo/http.dart';
import 'package:mfa/pages/demo/list.dart';
import 'package:mfa/pages/demo/model.dart';
import 'package:mfa/pages/demo/other.dart';
import 'package:mfa/pages/demo/provider.dart';
import 'package:mfa/pages/demo/sync_device.dart';
import 'package:mfa/pages/demo/toast.dart';
import 'package:mfa/pages/demo/url_launcher.dart';
import 'package:mfa/pages/demo/view.dart';
import 'package:mfa/pages/demo/webview.dart';
import 'package:mfa/pages/home.dart';
import 'package:mfa/pages/login.dart';
import 'package:mfa/routes/slide_page_builder.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      pageBuilder: slidePageBuilder((context) => const HomePage()),
    ),
    GoRoute(
      path: '/provider',
      pageBuilder: slidePageBuilder((context) => const ProvidePage()),
    ),
    GoRoute(
      path: '/dialog',
      pageBuilder: slidePageBuilder((context) => const DialogPage()),
    ),
    GoRoute(
      path: '/form',
      pageBuilder: slidePageBuilder((context) => FormPage()),
    ),
    GoRoute(
      path: '/viewPage',
      pageBuilder: slidePageBuilder((context) => const ViewPage()),
    ),
    GoRoute(
      path: '/other',
      pageBuilder: slidePageBuilder((context) => const OtherPage()),
    ),
    GoRoute(
      path: '/webview',
      pageBuilder: slidePageBuilder((context) => const WebviewPage()),
    ),
    GoRoute(
      path: '/model',
      pageBuilder: slidePageBuilder((context) => const ModelPage()),
    ),
    GoRoute(
      path: '/day',
      pageBuilder: slidePageBuilder((context) => const DayPage()),
    ),
    GoRoute(
      path: '/list',
      pageBuilder: slidePageBuilder(
          (context) => const ListPage(key: ValueKey('ListPage'))),
    ),
    GoRoute(
      path: '/login',
      pageBuilder: slidePageBuilder((context) => const LoginPage()),
    ),
    GoRoute(
      pageBuilder: slidePageBuilder((context) => const AdaptivePage()),
      path: '/adaptive',
    ),
    GoRoute(
      path: '/toast',
      pageBuilder: slidePageBuilder((context) => const ToastPage()),
    ),
    GoRoute(
      path: '/device',
      pageBuilder: slidePageBuilder((context) => const DevicePage()),
    ),
    GoRoute(
      path: '/sync_device',
      pageBuilder: slidePageBuilder((context) => const SyncDevicePage()),
    ),
    GoRoute(
      path: '/url_launcher',
      pageBuilder: slidePageBuilder((context) => const UrlLauncherPage()),
    ),
    GoRoute(
      path: '/http',
      pageBuilder: slidePageBuilder((context) => const HttpPage()),
    ),
  ],
);
