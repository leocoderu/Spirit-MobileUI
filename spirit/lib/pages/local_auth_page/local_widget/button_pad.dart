import 'package:flutter/material.dart';

import 'package:spirit/src/styles/button_style.dart';
import 'package:spirit/src/styles/font_style.dart';

class ButtonPad extends StatelessWidget {
  const ButtonPad({super.key, this.enable, this.padding, this.icon, this.text, this.onPressed});

  final bool? enable;
  final EdgeInsetsGeometry? padding;
  final String? text;
  final IconData? icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(0.0),
      child: ElevatedButton(
        style: enable ?? true
            ? elevatedButtonDefaultStyle.copyWith(
              minimumSize: WidgetStatePropertyAll(Size(60, 60)),
              maximumSize: WidgetStatePropertyAll(Size(60, 60)),
            )
            : elevatedButtonDisabledStyle.copyWith(
              minimumSize: WidgetStatePropertyAll(Size(60, 60)),
              maximumSize: WidgetStatePropertyAll(Size(60, 60)),
            ),
        onPressed: (enable ?? true) ? onPressed : null,
        child: (icon != null) ? Icon(icon) : Text(text ?? '', style: elevatedButtonText),
      ),
    );
  }
}
