// Import Flutter
import 'package:flutter/material.dart';
// Import Packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spirit/fluro_router.dart';
// Import Modules
import 'package:spirit/pages/auth_page/auth_widgets/finger_print.dart';
import 'package:spirit/pages/auth_page/auth_widgets/login_pass.dart';
import 'package:spirit/src/styles/app_colors.dart';
import 'package:spirit/src/styles/button_style.dart';
import 'package:spirit/src/styles/font_style.dart';
import 'package:spirit/src/widgets/back_ground.dart';
import 'package:spirit/src/widgets/logo.dart';

class AuthPage extends StatelessWidget {
  static const routeName = '/auth';
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool _orientation = MediaQuery.of(context).orientation == Orientation.portrait;
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final _bottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      body: PopScope(
        canPop: false,
        child: Stack(
          children: [
            BackGround(firstColor: mainColor100, secondColor: mainColor400),
            Logo(
              widthLogo: 96,
              X: _orientation ? ((_width - 96) / 2) : ((_width - 96) / 2) - 180,
              Y: _orientation
                       ? ((_height - 139 - (_bottom * 0.822)) / 2) - 180 - 5
                       : ((_height - 139 - (_bottom * 0.822)) / 2) - 5,
            ),
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      alignment: _orientation? Alignment.center : Alignment.centerRight,
                      //color: Colors.green,
                      child: LoginPass(),
                      //child: FingerPrint(),
                      // child: Container(
                      //   height: 380,
                      //   child: CarouselView(
                      //       itemExtent: MediaQuery.of(context).size.width,
                      //       backgroundColor: Colors.transparent,
                      //       padding: EdgeInsets.only(top: 50),
                      //       elevation: 5,
                      //       overlayColor: null,
                      //       reverse: true,
                      //
                      //       itemSnapping: true,
                      //       onTap: null,
                      //       children: <Widget>[
                      //         LoginPass(),
                      //         FingerPrint(),
                      //         LoginPass(),
                      //       ],
                      //   ),
                      //),
                    ),
                  ),
                  if(MediaQuery.of(context).viewInsets.bottom == 0.0)
                    TextButton(
                      style: textButtonStyle,
                      onPressed: null,
                      child: Text('Registration in the system', style: textButtonText),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
