import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const Button(
    this.text, {
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return MaterialButton(
        onPressed: onPressed,
        // shape: const RoundedRectangleBorder(
        //   borderRadius: BorderRadius.all(Radius.circular(4)),
        // ),
        color: colorScheme.primary,
        textColor: colorScheme.onPrimary,
        // style: ElevatedButton.styleFrom(
        //   foregroundColor: colorScheme.onPrimaryContainer,
        // ),
        child: Text(text));
  }
}
