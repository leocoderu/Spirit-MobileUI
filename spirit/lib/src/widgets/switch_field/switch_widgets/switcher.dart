import 'package:flutter/material.dart';
import 'package:spirit/src/shared/app_colors.dart';
class Switcher extends StatelessWidget {
  const Switcher({super.key, this.size, this.position, required this.onChange});

  final Size? size;
  final int? position;
  //final void Function(int) onChange;
  final VoidCallback onChange;

  @override
  Widget build(BuildContext context) {
    Size _size = size ?? Size(40, 24);
    int _position = position ?? 0; // 0 - 1 / 0 - 2 - 1
    final BoxDecoration decoOn = BoxDecoration(
      //color: whiteColor100,
      border: Border.all(color: greenColor400, width: 1),
      borderRadius: BorderRadius.circular(_size.height/2),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [greenColor400, greenColor100],
        stops: [0, 0.4],
      ),
    );
    final BoxDecoration decoOff = BoxDecoration(
      //color: whiteColor100,
      border: Border.all(color: redColor400, width: 1),
      borderRadius: BorderRadius.circular(_size.height/2),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [redColor400, redColor100],
        stops: [0, 0.4],
      ),
    );
    final BoxDecoration decoWait = BoxDecoration(
      //color: whiteColor100,
      border: Border.all(color: blackColor400, width: 1),
      borderRadius: BorderRadius.circular(_size.height/2),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [blackColor400, blackColor100],
        stops: [0, 0.4],
      ),
    );
    return GestureDetector(
      // onTap: () {
      //   _position = _position == 0 ? 1 : 0;
      //   onChange(_position);
      //   print('Tapped: $_position');
      // },
      onTap: onChange,
      child: Container(
        //color: Colors.purpleAccent,
        padding: EdgeInsets.all(2),
        alignment: _position == 0 ? Alignment.centerLeft : (_position == 1 ? Alignment.centerRight :  Alignment.center),
        width: _size.width,
        height: _size.height,
        decoration: _position == 0 ? decoOff : (_position == 1 ? decoOn :  decoWait),
        child: SizedBox(
          height: 18,
          width: 18,
          child: Container(
            //   height: 10,
            //   width: 10,
            decoration: BoxDecoration(
              //  color: Colors.red,
              //border: Border.all(color: blackColor300, width: 0.5),
              borderRadius: BorderRadius.circular(9),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [blackColor100, blackColor300],
                stops: [0.4, 1],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
