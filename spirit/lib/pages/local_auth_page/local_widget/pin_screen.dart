import 'package:flutter/material.dart';
//import 'package:spirit/pages/local_auth_page/local_widget/one_screen.dart';
import 'package:spirit/src/widgets/one_field.dart';

class PinScreen extends StatelessWidget {
  const PinScreen({super.key, this.height, this.width, this.padding});

  final double? height;
  final double? width;

  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: height ?? double.infinity,
      //width: width ?? double.infinity,
      color: Colors.blue,
      padding: padding ?? EdgeInsets.all(0.0),
      child: Row(
        children: [
          OneField(height: height, width: height, icon: Icons.adb),
          // Expanded(child: Container()),
          // OneField(height: height, width: height, icon: Icons.adb),
          // Expanded(child: Container()),
          // OneField(height: height, width: height, icon: Icons.adb),
          // Expanded(child: Container()),
          // OneField(height: height, width: height),
        ],
      ),
    );
  }
}
