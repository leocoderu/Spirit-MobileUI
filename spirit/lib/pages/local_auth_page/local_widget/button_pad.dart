import 'package:flutter/material.dart';
import 'package:spirit/src/shared/app_colors.dart';
import 'package:spirit/src/shared/button_style.dart';
import 'package:spirit/src/shared/font_style.dart';

class ButtonPad extends StatelessWidget {
  const ButtonPad({super.key, this.padding, this.icon, this.text, this.onPressed});

  final EdgeInsetsGeometry? padding;
  final String? text;
  final IconData? icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(0.0),
      child: ElevatedButton(
        style: elevatedButtonStyle.copyWith(
          minimumSize: WidgetStatePropertyAll(Size(60, 60)),
          maximumSize: WidgetStatePropertyAll(Size(60, 60)),
        ),
        onPressed: onPressed,
        child: (icon != null) ? Icon(icon) : Text(text ?? '', style: elevatedButtonText.copyWith(color: blackColor100),),
      ),
    );
  }
}
