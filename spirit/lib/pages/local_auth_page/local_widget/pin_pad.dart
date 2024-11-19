import 'package:flutter/material.dart';
import 'package:spirit/pages/local_auth_page/local_widget/button_pad.dart';

class PinPad extends StatelessWidget {
  const PinPad({super.key, this.height, this.width});

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height ?? double.infinity,
        width: width ?? double.infinity,
        padding: EdgeInsets.all(0.0),
        child: Column(
          children: [
            Expanded(
              //padding: EdgeInsets.only(bottom: 10.0),
              child: Row(
                children: [
                  ButtonPad(text: '1'),
                  Expanded(child: Container()),
                  ButtonPad(text: '2'),
                  Expanded(child: Container()),
                  ButtonPad(text: '3'),
                ],
              ),
            ),
            Expanded(
              //padding: EdgeInsets.only(bottom: 10.0),
              child: Row(
                children: [
                  ButtonPad(text: '4',),
                  Expanded(child:  Container()),
                  ButtonPad(text: '5',),
                  Expanded(child:  Container()),
                  ButtonPad(text: '6'),
                ],
              ),
            ),
            Expanded(
              //padding: EdgeInsets.only(bottom: 10.0),
              child: Row(
                children: [
                  ButtonPad(text: '7'),
                  Expanded(child:  Container()),
                  ButtonPad(text: '8'),
                  Expanded(child:  Container()),
                  ButtonPad(text: '9'),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  ButtonPad(icon: Icons.fingerprint),
                  Expanded(child:  Container()),
                  ButtonPad(text: '0'),
                  Expanded(child:  Container()),
                  ButtonPad(icon: Icons.backspace),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
