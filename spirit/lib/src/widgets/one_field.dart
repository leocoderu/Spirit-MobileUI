import 'package:flutter/material.dart';
import 'package:spirit/src/shared/box_style.dart';

class OneField extends StatelessWidget {
  const OneField({super.key, this.size, this.icon, this.padding, this.decoration});

  final Size? size;
  final IconData? icon;
  final EdgeInsetsGeometry? padding;
  final BoxDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size != null ? size!.height : double.infinity,
      width:  size != null ? size!.width  : double.infinity,
      padding: padding ?? EdgeInsets.all(0.0),
      decoration: decoration ?? boxDefaultStyle,
      child: icon != null ? Icon(icon) : null,
    );
  }
}
