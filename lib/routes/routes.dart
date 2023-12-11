import 'package:go_router/go_router.dart';
import 'package:mfa/pages/demo/day.dart';
import 'package:mfa/pages/demo/dialog.dart';
import 'package:mfa/pages/demo/form.dart';
import 'package:mfa/pages/demo/list.dart';
import 'package:mfa/pages/demo/model.dart';
import 'package:mfa/pages/demo/other.dart';
import 'package:mfa/pages/demo/provider.dart';
import 'package:mfa/pages/demo/view.dart';
import 'package:mfa/pages/demo/webview.dart';
import 'package:mfa/pages/home.dart';
import 'package:mfa/pages/login.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
        path: '/provider', builder: (context, state) => const ProvidePage()),
    GoRoute(path: '/dialog', builder: (context, state) => const DialogPage()),
    GoRoute(path: '/form', builder: (context, state) => FormPage()),
    GoRoute(path: '/viewPage', builder: (context, state) => const ViewPage()),
    GoRoute(path: '/other', builder: (context, state) => const OtherPage()),
    GoRoute(path: '/webview', builder: (context, state) => const WebviewPage()),
    GoRoute(path: '/model', builder: (context, state) => const ModelPage()),
    GoRoute(path: '/day', builder: (context, state) => const DayPage()),
    GoRoute(path: '/list', builder: (context, state) => const ListPage()),
    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
  ],
);
