import 'package:flutter/material.dart';
import 'package:mfa/pages/home.dart';
import 'package:mfa/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MFA二次验证码',
      theme: ThemeData(
        primaryColor: Colors.blue,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(
            color: Colors.white,
          ),
          iconTheme: IconThemeData(
            color: Colors.white, // 设置返回按钮的颜色
          ),
        ),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light, // 主题模式
      routes: {
        "login": (context) => const LoginPage(),
        "/": (context) => const HomePage(), //注册首页路由
      },
    );
  }
}
