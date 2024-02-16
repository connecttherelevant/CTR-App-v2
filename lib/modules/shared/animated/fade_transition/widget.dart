import 'package:flutter/material.dart';
import 'package:musicidia/modules/shared/animated/fade_transition/controller.dart';

class FadeTransitionWidget extends StatefulWidget {
  final Widget child;
  final int duration;
  final Cubic curves;
  const FadeTransitionWidget({
    super.key,
    required this.child,
    required this.duration,
    required this.curves,
  });

  @override
  FadeTransitionWidgetState createState() => FadeTransitionWidgetState();
}

class FadeTransitionWidgetState extends State<FadeTransitionWidget>
    with TickerProviderStateMixin {
  late FadeTransitionController _fadeTransitionController;

  @override
  void initState() {
    super.initState();
    _fadeTransitionController = FadeTransitionController(
      vsync: this,
      duration: widget.duration,
      curve: widget.curves,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeTransitionController.fadeTransition,
      child: widget.child,
    );
  }
}
