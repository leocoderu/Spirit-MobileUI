import 'package:flutter/material.dart';

@immutable
class ShakeWidget extends StatelessWidget {
  const ShakeWidget({
    Key? key,
    this.shakeStart = false,
    this.duration = const Duration(milliseconds: 500),
    this.deltaX = 20,
    this.curve = Curves.bounceOut,
    this.onEnd,
    required this.child,
  }) : super(key: key);

  final bool shakeStart;
  final Duration duration;
  final double deltaX;
  final Widget child;
  final Curve curve;
  final VoidCallback? onEnd;

  /// convert 0-1 to 0-1-0
  double shake(double animation) =>
      2 * (0.5 - (0.5 - curve.transform(animation)).abs());
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      key: key,
      tween: shakeStart ? Tween(begin: 0.0, end: 1.0) : Tween(begin: 0.0, end: 0.0),
      duration: duration,
      builder: (context, animation, child) => Transform.translate(
        offset: Offset(deltaX * shake(animation), 0),
        child: child,
      ),
      child: child,
      onEnd: onEnd,
    );
  }
}