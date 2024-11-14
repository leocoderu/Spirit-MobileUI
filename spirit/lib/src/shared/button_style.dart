import 'package:flutter/material.dart';
import 'package:spirit/src/shared/app_colors.dart';

ButtonStyle elevatedButtonStyle = ButtonStyle(
  minimumSize: const WidgetStatePropertyAll(Size(320, 60)),
  maximumSize: const WidgetStatePropertyAll(Size(320, 60)),
  elevation: const WidgetStatePropertyAll(5.0),
  foregroundColor: const WidgetStatePropertyAll(blackColor100),
  backgroundColor: const WidgetStatePropertyAll(mainColor200),
  shape: WidgetStatePropertyAll(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  ),
);

ButtonStyle textButtonStyle = ButtonStyle(
  minimumSize: WidgetStatePropertyAll(Size(320, 50)),
  maximumSize: WidgetStatePropertyAll(Size(320, 50)),
  foregroundColor: WidgetStatePropertyAll(blackColor100),
);