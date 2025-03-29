import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage<T> transitionPage<T>(
  Widget child, {
  required Offset beginOffset,
}) {
  return CustomTransitionPage<T>(
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(begin: beginOffset, end: Offset.zero)
            .animate(animation),
        child: child,
      );
    },
  );
}

enum PageTransitionDirection {
  toUp(Offset(0, 1)),
  toLeft(Offset(1, 0));

  final Offset offset;
  const PageTransitionDirection(this.offset);
}
