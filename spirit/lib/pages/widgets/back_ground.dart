import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  const BackGround({super.key});

  @override
  Widget build(BuildContext context) {
    bool orientation = MediaQuery.of(context).orientation == Orientation.portrait;
    const first  = Color(0xFFA3B3EB);
    const second = Color(0xFF5267B2);
    return Transform.rotate(
      angle: orientation ? -1.2 : -0.4,
      child: Transform.scale(
        scaleX: orientation ? 3.4 : 4,
        scaleY: orientation ? 1.7 : 2,
        child: Container(
          decoration: BoxDecoration(
              gradient: RadialGradient(
                center: orientation ? Alignment(0.3, 0.05) : Alignment(0.1, -0.05),
                radius: orientation ? 0.5 : 0.35,
                colors: <Color>[ first, second ],
                stops: [ 0.0, 1.0 ],
              )
          ),
        ),
      ),
    );
  }
}
