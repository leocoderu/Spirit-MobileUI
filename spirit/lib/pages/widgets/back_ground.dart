import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  const BackGround({super.key, this.firstColor, this.secondColor});

  final Color? firstColor;
  final Color? secondColor;

  @override
  Widget build(BuildContext context) {
    bool orientation = MediaQuery.of(context).orientation == Orientation.portrait;

    final first  = firstColor  == null ? Color(0xFFA3B3EB) : firstColor;
    final second = secondColor == null ? Color(0xFF5267B2) : secondColor;

    return Container(
      color: second,
      width: double.infinity,
      height: double.infinity,
      child: Transform.rotate(
        angle: orientation ? 0.4 : -0.4,
        child: Transform.scale(
          scaleX: orientation ? 2 : 4,
          scaleY: orientation ? 4 : 2,
          child: Container(
            decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: orientation ? Alignment(0.0, -0.15) : Alignment(0.1, -0.05),
                  radius: orientation ? 0.4 : 0.35,
                  colors: <Color>[ first!, second! ],
                  stops: [ 0.0, 1.0 ],
                )
            ),
          ),
        ),
      ),
    );
  }
}
