import 'package:flutter/material.dart';

class PageAnimator extends PageRouteBuilder {
  final Widget child;

  PageAnimator({required this.child})
      : super(
            transitionDuration: const Duration(milliseconds: 350),
            pageBuilder: (context, animation, secondaryAnimation) => child);
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return ScaleTransition(scale: animation, child: child);
  }
}
