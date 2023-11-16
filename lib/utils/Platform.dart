import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

bool isDarkMode(BuildContext context) {
  var brightness = Theme.of(context).brightness;
  return brightness == Brightness.dark;
}

SystemUiOverlayStyle getSystemUiOverlayStyle(BuildContext context) {
  final Brightness brightnessValue = MediaQuery.of(context).platformBrightness;

  const statusBarStyle =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent); // 提前定义状态栏颜色

  return brightnessValue == Brightness.dark
      ? statusBarStyle.copyWith(
          statusBarIconBrightness: Brightness.light) // 暗黑模式下设置状态栏图标为白色
      : statusBarStyle.copyWith(
          statusBarIconBrightness: Brightness.dark); // 明亮模式下设置状态栏图标为黑色
}
