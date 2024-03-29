import 'package:flutter/cupertino.dart';

class SafeScrollView extends StatelessWidget {
  final Widget child;

  const SafeScrollView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: child,
      ),
    );
  }
}
