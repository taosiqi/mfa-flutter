import 'package:flutter/material.dart';

Widget buildButton(BuildContext context, String text, VoidCallback onPressed) {
  final colorScheme = Theme.of(context).colorScheme;
  return MaterialButton(
    autofocus: true,
    onPressed: onPressed,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(4)),
    ),
    color: colorScheme.primary,
    textColor: colorScheme.onPrimary,
    child: Text(text),
  );
}
