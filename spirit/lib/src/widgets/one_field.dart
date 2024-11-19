import 'package:flutter/material.dart';

import 'package:spirit/src/shared/app_colors.dart';
//import 'package:spirit/src/shared/font_style.dart';

class OneField extends StatelessWidget {
  const OneField({super.key, this.height, this.width, this.icon, this.padding});

  final double? height;
  final double? width;

  final IconData? icon;

  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? double.infinity,
      width: width ?? double.infinity,
      padding: padding ?? EdgeInsets.all(0.0),
      //child: Container(
        decoration: BoxDecoration(
          color: whiteColor100,
          border: Border.all(color: blackColor300, width: 1),
          borderRadius: BorderRadius.circular(10.0),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [blackColor200, whiteColor100],
            stops: [0, 0.22],
          ),
        ),

        child: icon != null ? Icon(icon) : null,
      //),
    );
  }
}
