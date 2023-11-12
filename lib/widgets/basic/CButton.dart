import 'package:flutter/material.dart';

extension CustomElevatedButton on ElevatedButton {
  static ElevatedButton custom(
      {required VoidCallback onPressed,
      required Widget child,
      double radius = 5.0}) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
