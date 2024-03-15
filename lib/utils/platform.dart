import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

bool isDarkMode(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
}

SystemUiOverlayStyle getSystemUiOverlayStyle(BuildContext context) {
  final Brightness brightnessValue = MediaQuery.of(context).platformBrightness;
  final theme = Theme.of(context).colorScheme;

  const statusBarStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  );

  return statusBarStyle.copyWith(
    statusBarIconBrightness:
        brightnessValue == Brightness.dark ? Brightness.light : Brightness.dark,
    systemNavigationBarColor: theme.background,
    systemNavigationBarDividerColor: theme.background,
  );
}
