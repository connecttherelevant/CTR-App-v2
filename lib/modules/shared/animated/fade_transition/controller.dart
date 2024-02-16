import 'package:flutter/material.dart';

class FadeTransitionController {
  late AnimationController animation;
  late Animation<double> fadeTransition;
  final TickerProviderStateMixin vsync;

  FadeTransitionController(
      {
      required this.vsync,
      required duration,
      required curve,
      }) {
    animation = AnimationController(
      vsync: vsync,
      duration: Duration(seconds: duration),

    );
    fadeTransition = CurvedAnimation(
      parent: animation,
      curve: curve,
    );
    animation.forward();
  }

  void dispose() {
    animation.dispose();
  }
}
