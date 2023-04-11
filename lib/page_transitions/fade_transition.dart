import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FadePageTransition extends CustomTransitionPage {
  final Duration? duration;
  final Duration? reverseDuration;
  final bool fullDialog;

  FadePageTransition({
    super.key,
    required super.child,
    this.duration,
    this.reverseDuration,
    this.fullDialog = false,
  }) : super(
          transitionDuration: duration ?? const Duration(milliseconds: 450),
          reverseTransitionDuration: reverseDuration ?? const Duration(milliseconds: 450),
          fullscreenDialog: fullDialog,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            // Change the opacity of the screen using a Curve based on the the animation's
            // value
            return FadeTransition(
              opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
              child: child,
            );
          },
        );
}
