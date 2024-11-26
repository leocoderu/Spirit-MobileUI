import 'package:flutter/material.dart';
import 'package:spirit/src/widgets/one_field.dart';

class PinScreen extends StatelessWidget {
  const PinScreen({super.key, this.height, this.width, this.padding, this.decoration, required this.digits, this.value});

  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final BoxDecoration? decoration;
  final int digits;
  final int? value;

  @override
  Widget build(BuildContext context) {
    Size ofSize = Size(height ?? double.infinity, height ?? double.infinity);
    return Container(
      height: height ?? double.infinity,
      width: width ?? double.infinity,
      //color: Colors.blue,
      padding: padding ?? EdgeInsets.all(0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for(int i = 0; i < digits; i++)
             OneField(size: ofSize, decoration: decoration, icon: value! > i ? Icons.lock : null),
        ],
      ),
    );
  }
}
