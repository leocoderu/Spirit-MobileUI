import 'package:flutter/material.dart';
import 'package:spirit/src/shared/app_colors.dart';
import 'package:spirit/src/widgets/one_field.dart';

class PinScreen extends StatelessWidget {
  const PinScreen({super.key, this.height, this.width, this.padding, this.borderColor, this.backgroundColor1, this.backgroundColor2, this.value});

  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final Color?  borderColor;
  final Color?  backgroundColor1;
  final Color?  backgroundColor2;

  final String? value;

  @override
  Widget build(BuildContext context) {
    Size ofSize = Size(height ?? double.infinity, height ?? double.infinity);
    BoxDecoration bDecor = BoxDecoration(
      color: whiteColor100,
      border: Border.all(color: borderColor ?? blackColor300, width: 1),
      borderRadius: BorderRadius.circular(10.0),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [backgroundColor1 ?? blackColor200, backgroundColor2 ?? whiteColor100],
        stops: [0, 0.22],
      ),
    );
    return Container(
      height: height ?? double.infinity,
      width: width ?? double.infinity,
      //color: Colors.blue,
      padding: padding ?? EdgeInsets.all(0.0),
      child: Row(
        children: [
          OneField(size: ofSize, style: bDecor, icon: value!.length > 0 ? Icons.adb : null),
          Expanded(child: Container()),
          OneField(size: ofSize, style: bDecor, icon: value!.length > 1 ? Icons.adb : null),
          Expanded(child: Container()),
          OneField(size: ofSize, style: bDecor, icon: value!.length > 2 ? Icons.adb : null),
          Expanded(child: Container()),
          OneField(size: ofSize, style: bDecor, icon: value!.length > 3 ? Icons.adb : null),
        ],
      ),
    );
  }
}
