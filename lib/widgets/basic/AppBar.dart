import 'package:flutter/material.dart';
import 'package:mfa/utils/Platform.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final dynamic title; // Now title can be a String or a Widget
  final List<Widget>? actions;

  const BasicAppBar({Key? key, required this.title, this.actions = const []})
      : assert(title is String ||
            title is Widget), // Assert title to be String or Widget
        super(key: key);

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
            : title, // Else, it's a Widget so use it directly
        centerTitle: true);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
