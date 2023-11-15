import 'package:flutter/material.dart';

class AppThemes {
  static const primary = Colors.blue;
  static const white = Colors.white;
  static const black = Colors.black;

  static final ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme(
      // 定义主要颜色
      primary: Colors.blue,
      // 定义次要颜色
      secondary: Colors.blue,
      // 定义表面颜色
      surface: Colors.white,
      // 定义背景颜色
      background: Colors.white,
      // 定义错误颜色
      error: Colors.red,
      // 定义在主要颜色上的颜色
      onPrimary: Colors.white,
      // 定义在次要颜色上的颜色
      onSecondary: Colors.black,
      // 定义在表面颜色上的颜色
      onSurface: Colors.black,
      // 定义在背景颜色上的颜色
      onBackground: Colors.black,
      // 定义在错误颜色上的颜色
      onError: Colors.white,
      // 定义亮度
      brightness: Brightness.light,
    ),
    useMaterial3: true,
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme(
      // 定义主要颜色
      primary: Colors.blue,
      // 定义次要颜色
      secondary: Colors.blue[200]!,
      // 定义表面颜色
      surface: Colors.grey[850]!,
      // 定义背景颜色
      background: Colors.grey[900]!,
      // 定义错误颜色
      error: Colors.red,
      // 定义在主要颜色上的颜色
      onPrimary: Colors.white,
      // 定义在次要颜色上的颜色
      onSecondary: Colors.white,
      // 定义在表面颜色上的颜色
      onSurface: Colors.white,
      // 定义在背景颜色上的颜色
      onBackground: Colors.white,
      // 定义在错误颜色上的颜色
      onError: Colors.black,
      // 定义亮度
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
  );
}
