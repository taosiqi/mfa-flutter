import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

GoRouterPageBuilder slidePageBuilder(WidgetBuilder builder) {
  return (BuildContext context, GoRouterState state) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: builder(context),
      transitionsBuilder: slideTransition,
    );
  };
}

// 自定义的侧滑动画
Widget slideTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  var begin = const Offset(1.0, 0.0);
  var end = Offset.zero;
  var curve = Curves.ease;

  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  var offsetAnimation = animation.drive(tween);

  return SlideTransition(
    position: offsetAnimation,
    child: child,
  );
}
