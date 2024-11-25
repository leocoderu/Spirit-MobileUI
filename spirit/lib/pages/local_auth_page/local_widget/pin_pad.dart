import 'package:flutter/material.dart';

import 'package:spirit/pages/local_auth_page/local_widget/button_pad.dart';

class PinPad extends StatelessWidget {
  const PinPad({super.key, this.height, this.width,
    this.biometric, required this.onChange, this.onAction1, this.onAction2,
  });

  final double? height;
  final double? width;

  final bool? biometric;
  final void Function(int) onChange;
  final VoidCallback? onAction1;
  final VoidCallback? onAction2;

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
                  ButtonPad(text: '1', onPressed: () => onChange(1)),
                  ButtonPad(text: '2', onPressed: () => onChange(2)),
                  ButtonPad(text: '3', onPressed: () => onChange(3)),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonPad(text: '4', onPressed: () => onChange(4)),
                  ButtonPad(text: '5', onPressed: () => onChange(5)),
                  ButtonPad(text: '6', onPressed: () => onChange(6)),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonPad(text: '7', onPressed: () => onChange(7)),
                  ButtonPad(text: '8', onPressed: () => onChange(8)),
                  ButtonPad(text: '9', onPressed: () => onChange(9)),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonPad(icon: Icons.fingerprint, enable: biometric, onPressed: onAction1),
                  ButtonPad(text: '0', onPressed: () => onChange(0)),
                  ButtonPad(icon: Icons.backspace, onPressed: () => onAction2),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
