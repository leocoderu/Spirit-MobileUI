import 'package:flutter/material.dart';

class ShakeTrinity extends StatefulWidget {
  const ShakeTrinity({super.key, required this.start, this.offset, this.duration, this.onEnd, required this.child});

  final bool start;
  final double? offset;
  final Duration? duration;
  final void Function(String)? onEnd;
  //final VoidCallback? onEnd;
  final Widget child;

  @override
  State<ShakeTrinity> createState() => _ShakeTrinityState();
}

class _ShakeTrinityState extends State<ShakeTrinity> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(duration: (widget.duration ?? const Duration(seconds: 1)), vsync: this);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ShakeTrinity oldWidget) {
    if (widget.start) {
      controller.forward(from: 0.0);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {

    final Animation<double> offsetAnimation =
    Tween(begin: 0.0, end: (widget.offset ?? 10.0)).chain(CurveTween(curve: Curves.elasticIn)).animate(controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse().then((v) {
             widget.onEnd!('off');
             //widget.onEnd;
           });
        }
      });

    return
      AnimatedBuilder(
        animation: offsetAnimation,
        builder: (buildContext, child) {
          return Container(
            //color: Colors.lime,
            //margin: EdgeInsets.symmetric(horizontal: (widget.offset ?? 10.0)),
            padding: EdgeInsets.only(left: offsetAnimation.value + (widget.offset ?? 10.0), right: (widget.offset ?? 10.0) - offsetAnimation.value),
            child: widget.child,
          );
        },
    );
  }
}
