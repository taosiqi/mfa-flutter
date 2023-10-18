import 'package:flutter/material.dart';

bool isDarkMode(BuildContext context) {
  var brightness = Theme.of(context).brightness;
  return brightness == Brightness.dark;
}
