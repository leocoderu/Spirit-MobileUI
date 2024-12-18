import 'package:flutter/material.dart';
import 'package:spirit/src/styles/app_colors.dart';

BoxDecoration boxDefaultStyle = BoxDecoration(
  color: whiteColor100,
  border: Border.all(color: blackColor300, width: 1),
  borderRadius: BorderRadius.circular(10.0),
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [blackColor200, whiteColor100],
    stops: [0, 0.22],
  ),
);

BoxDecoration boxErrorStyle = boxDefaultStyle.copyWith(
  border: Border.all(color: redColor200, width: 1),
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [redColor200, redColor100],
    stops: [0, 0.22],
  ),
);