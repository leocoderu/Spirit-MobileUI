import 'package:flutter/material.dart';

import 'app_colors.dart';

const String fontFamily = "Exo2";

const TextStyle logoName = TextStyle(
  fontFamily: fontFamily,
  fontSize: 50,
  fontWeight: FontWeight.w400,
);

const TextStyle header1 = TextStyle(
  fontFamily: fontFamily,
  fontSize: 30,
  fontWeight: FontWeight.w400,
);

const TextStyle header2 = TextStyle(
  fontFamily: fontFamily,
  fontSize: 20,
  fontWeight: FontWeight.w400,
);

const TextStyle elevatedButtonText = TextStyle(
  fontFamily: fontFamily,
  fontSize: 20,
  fontWeight: FontWeight.w500,
  color: blackColor100,
);

const TextStyle textButtonText = TextStyle(
  fontFamily: fontFamily,
  fontSize: 16,
  fontWeight: FontWeight.w300,
  shadows: [
    Shadow(
      color: Color.fromRGBO(0, 0, 0, 0.5),
      offset: Offset(2, 2),
      blurRadius: 3,
    ),
  ],
);

const TextStyle inputText = TextStyle(
  fontFamily: fontFamily,
  fontSize: 20,
  fontWeight: FontWeight.w400,
);

const TextStyle inputLabel = TextStyle(
  fontFamily: fontFamily,
  fontSize: 16,
  fontWeight: FontWeight.w400,
);

const TextStyle inputHint = TextStyle(
  fontFamily: fontFamily,
  fontSize: 12,
  fontWeight: FontWeight.w400,
);



// w100 - Extra Light
// w200 - Light
// w300 - Thin
// w400 - Regular
//      - MediumBold
//      - SemiBold
// w700 - Bold
// w800 - ExtraBold
// w900 - Black