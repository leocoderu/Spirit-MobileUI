import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:spirit/pages/local_auth_page/local_widget/button_pad.dart';

class PinPad extends StatelessWidget {
  const PinPad({super.key, this.height, this.width, required this.pincode, required this.onChange});

  final double? height;
  final double? width;

  final String pincode;
  final void Function(String) onChange;

//   @override
//   State<PinPad> createState() => _PinPadState();
// }
//
// class _PinPadState extends State<PinPad> {

  //String pincode = '';

  void addPin(int cod) {
    // setState(() {
    //   pincode += cod.toString();
    // });
    //String resStr = widget.pincode.toString() + cod.toString();
    onChange(pincode.toString() + cod.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height ?? double.infinity,
        width:  width ?? double.infinity,
        padding: EdgeInsets.all(0.0),
        child: Column(
          children: [
            Expanded(
              //padding: EdgeInsets.only(bottom: 10.0),
              child: Row(
                children: [
                  ButtonPad(text: '1', onPressed: () => addPin(1)),
                  Expanded(child: Container()),
                  ButtonPad(text: '2', onPressed: () => addPin(2)),
                  Expanded(child: Container()),
                  ButtonPad(text: '3', onPressed: () => addPin(3)),
                ],
              ),
            ),
            Expanded(
              //padding: EdgeInsets.only(bottom: 10.0),
              child: Row(
                children: [
                  ButtonPad(text: '4', onPressed: () => addPin(4)),
                  Expanded(child:  Container()),
                  ButtonPad(text: '5', onPressed: () => addPin(5)),
                  Expanded(child:  Container()),
                  ButtonPad(text: '6', onPressed: () => addPin(6)),
                ],
              ),
            ),
            Expanded(
              //padding: EdgeInsets.only(bottom: 10.0),
              child: Row(
                children: [
                  ButtonPad(text: '7', onPressed: () => addPin(7)),
                  Expanded(child:  Container()),
                  ButtonPad(text: '8', onPressed: () => addPin(8)),
                  Expanded(child:  Container()),
                  ButtonPad(text: '9', onPressed: () => addPin(9)),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  ButtonPad(icon: Icons.fingerprint),
                  Expanded(child:  Container()),
                  ButtonPad(text: '0', onPressed: () => addPin(0)),
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
