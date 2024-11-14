import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  const BackGround({super.key, required this.firstColor, required this.secondColor});
  final Color firstColor;
  final Color secondColor;

  @override
  Widget build(BuildContext context) {
    bool _orientation = MediaQuery.of(context).orientation == Orientation.portrait;
    return Container(
      color: secondColor,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Transform.rotate(
        angle: _orientation ? 0.4 : -0.4,
        child: Transform.scale(
          scaleX: _orientation ? 2 : 4,
          scaleY: _orientation ? 4 : 2,
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: _orientation ? const Alignment(0.0, -0.15) : const Alignment(0.1, -0.05),
                radius: _orientation ? 0.4 : 0.35,
                colors: <Color>[ firstColor, secondColor ],
                stops: const [ 0.0, 1.0 ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
