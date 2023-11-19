import 'package:flutter/material.dart';
import 'package:mfa/utils/Platform.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const BasicAppBar({Key? key, required this.title, this.actions = const []})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        systemOverlayStyle: getSystemUiOverlayStyle(context),
        actions: actions,
        title: Text(
          title,
          style: const TextStyle(fontSize: 22),
        ),
        centerTitle: true);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
