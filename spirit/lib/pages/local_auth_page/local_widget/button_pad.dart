import 'package:flutter/material.dart';
import 'package:spirit/src/shared/app_colors.dart';
import 'package:spirit/src/shared/button_style.dart';
import 'package:spirit/src/shared/font_style.dart';

class ButtonPad extends StatefulWidget {
  const ButtonPad({super.key, this.padding, this.icon, this.text, this.onPressed});

  final EdgeInsetsGeometry? padding;
  final String? text;
  final IconData? icon;
  final VoidCallback? onPressed;

  @override
  State<ButtonPad> createState() => _ButtonPadState();
}

class _ButtonPadState extends State<ButtonPad> {

  bool tapped = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: widget.padding ?? EdgeInsets.all(0.0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              tapped = true;
            });
          },
          onTapCancel: () {
            setState(() {
              tapped = false;
            });
          },
          child: ElevatedButton(
            style: elevatedButtonStyle.copyWith(
              minimumSize: WidgetStatePropertyAll(Size(60, 60)),
              maximumSize: WidgetStatePropertyAll(Size(60, 60)),
              elevation: tapped ? WidgetStatePropertyAll(0) : WidgetStatePropertyAll(5),
            ),
            onPressed: widget.onPressed,
            child: (widget.icon != null) ? Icon(widget.icon) : Text(widget.text ?? '', style: elevatedButtonText.copyWith(color: blackColor100),),
          ),
        ),
    );
  }
}
