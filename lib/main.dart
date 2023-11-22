import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:mfa/routes/routes.dart';
import 'package:provider/provider.dart';

import 'constants/Color.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding); // 保持屏幕海报
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final ThemeMode themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CountNotifier>(
          create: (ctx) => CountNotifier(),
        ),
        ChangeNotifierProvider<Person>(
          create: (ctx) => Person(),
        )
      ],
      child: MaterialApp(
        title: 'MFA二次验证码',
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          FormBuilderLocalizations.delegate,
        ],
        supportedLocales: const [Locale('zh', 'CN')],
        debugShowCheckedModeBanner: false,
        darkTheme: AppThemes.darkTheme,
        theme: AppThemes.lightTheme,
        themeMode: ThemeMode.system,
        routes: routes,
      ),
    );
  }
}

class CountNotifier extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }
}

class Person with ChangeNotifier {
  int age = 1;

  void changAge() {
    age += 1;
    notifyListeners();
  }
}
