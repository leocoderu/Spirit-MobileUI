import 'package:flutter/material.dart';

import 'package:business_layer/business_layer.dart';

import 'package:spirit/pages/local_auth_page/local_widget/button_pad.dart';

class PinPad extends StatelessWidget {
  const PinPad({super.key, this.height, this.width, required this.digits, required this.pincode, this.biometric, required this.onChange, this.onBiometric});

  final double? height;
  final double? width;

  final int digits;
  final String pincode;
  final bool? biometric;
  final void Function(String) onChange;
  final VoidCallback? onBiometric;

  void addPin(int cod) {
    if (pincode.length < digits)
      onChange(pincode.toString() + cod.toString());
  }

  void delPin() {
    if (pincode.length > 0) {
      onChange(pincode.substring(0, pincode.length - 1));
    }
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonPad(text: '1', onPressed: () => addPin(1)),
                  ButtonPad(text: '2', onPressed: () => addPin(2)),
                  ButtonPad(text: '3', onPressed: () => addPin(3)),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonPad(text: '4', onPressed: () => addPin(4)),
                  ButtonPad(text: '5', onPressed: () => addPin(5)),
                  ButtonPad(text: '6', onPressed: () => addPin(6)),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonPad(text: '7', onPressed: () => addPin(7)),
                  ButtonPad(text: '8', onPressed: () => addPin(8)),
                  ButtonPad(text: '9', onPressed: () => addPin(9)),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonPad(
                      icon: Icons.fingerprint,
                      enable: biometric,
                      onPressed: onBiometric,
                      //     () async {
                      //   bool res = await locator.get<LocalAuthController>().authUser();
                      //   print('result: $res');
                      // },
                  ),
                  ButtonPad(text: '0', onPressed: () => addPin(0)),
                  ButtonPad(icon: Icons.backspace, onPressed: () => delPin()),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
