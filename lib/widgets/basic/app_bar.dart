import 'package:flutter/material.dart';
import 'package:mfa/utils/platform.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final dynamic title; // Now title can be a String or a Widget
  final List<Widget>? actions;

  const BasicAppBar({super.key, required this.title, this.actions = const []})
      : assert(title is String || title is Widget,
            'title must be a string of at least 2 characters or a widget');

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AppBar(
        backgroundColor: colorScheme.background,
        systemOverlayStyle: getSystemUiOverlayStyle(context),
        actions: actions,
        title: title is String // Check if title is a String
            ? Text(
                title,
                style: const TextStyle(fontSize: 22),
              )
            : title,
        // Else, it's a Widget so use it directly
        centerTitle: true);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
