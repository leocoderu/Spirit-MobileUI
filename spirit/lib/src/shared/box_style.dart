import 'package:flutter/material.dart';
import 'package:spirit/src/shared/app_colors.dart';

BoxDecoration boxStyle = BoxDecoration(
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