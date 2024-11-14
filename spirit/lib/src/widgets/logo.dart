import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logo extends StatelessWidget {
  const Logo({super.key, required this.widthLogo, //required this.heightLogo,
    this.X, this.Y, this.offset, this.duration, this.onEnd,});

  final double widthLogo;
  final double? X;
  final double? Y;
  final double? offset;
  final Duration? duration;
  final VoidCallback? onEnd;

  @override
  Widget build(BuildContext context) {
    bool _orientation = MediaQuery.of(context).orientation == Orientation.portrait;
    double _x = X ?? (MediaQuery.of(context).size.width / 2);
    double _y = Y ?? (MediaQuery.of(context).size.height / 2);
    return AnimatedPositioned(
      duration: duration ?? const Duration(milliseconds: 0),
      left: _orientation ? _x : _x - (offset ?? 0.0),
      top:  _orientation ? _y - (offset ?? 0.0) : _y,
      child: AnimatedContainer(
        duration: duration ?? const Duration(milliseconds: 0),
        width: widthLogo,
        child: SvgPicture.asset('assets/system/svg/logo.svg'),
        onEnd: onEnd,
      ),
    );
  }
}
