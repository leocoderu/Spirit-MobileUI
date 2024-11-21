// Import Flutter
import 'package:business_layer/business_layer.dart';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:spirit/pages/local_auth_page/local_widget/pin_pad.dart';
import 'package:spirit/pages/local_auth_page/local_widget/pin_screen.dart';
// Import Packages
import 'package:spirit/fluro_router.dart';

// Import Modules
import 'package:spirit/src/shared/app_colors.dart';
import 'package:spirit/src/shared/box_style.dart';
import 'package:spirit/src/shared/font_style.dart';
//import 'package:spirit/src/shared/button_style.dart';
//import 'package:spirit/src/shared/font_style.dart';
import 'package:spirit/src/widgets/back_ground.dart';
import 'package:spirit/src/widgets/logo.dart';
import 'package:spirit/src/widgets/shake_widgets/shake_trinity.dart';
//import 'package:spirit/src/widgets/shake_widgets/shake_widget.dart';

class LocalAuthPage extends StatefulWidget {
  static const routeName = '/localauth';
  const LocalAuthPage({super.key});

  @override
  State<LocalAuthPage> createState() => _LocalAuthPageState();
}

class _LocalAuthPageState extends State<LocalAuthPage> with SingleTickerProviderStateMixin {

  String pincode = '';
  bool   start = false;
  BoxDecoration decoration = boxDefaultStyle;

  @override
  Widget build(BuildContext context) {
    final int digits = 4;

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
              X: _orientation ? ((_width - 96) / 2) : ((_width - 96) / 2) - 200,
              Y: _orientation
                  ? ((_height - 139 - (_bottom * 0.822)) / 2) - 180 - 5 - 90
                  : ((_height - 139 - (_bottom * 0.822)) / 2) - 5 - 80,
            ),
            Positioned.fill(
                top: _orientation ? 240 : 230,
                bottom: _orientation ? 420: 30,
                left: (_orientation) ? (_width - 320)/2 : 50,
                right: (_orientation) ? (_width - 320)/2 : 450,
                child: Container(
                  //color: Colors.deepPurpleAccent,
                  child: Column(
                    children: [
                      Container(
                        //color: Colors.deepOrange,
                        height: 80,
                        child: Text('Enter your PIN', style: header1.copyWith(color: blackColor100),),
                      ),
                      ShakeTrinity(
                        start: start,
                        offset: 25.0,
                        duration: const Duration(milliseconds: 500),
                        onEnd: (value) {
                          setState(() {
                            pincode = '';
                            decoration = boxDefaultStyle;
                            start = false;
                          });
                        },
                        child: PinScreen(height: 50.0, /*width: 350,*/ decoration: decoration, digits: digits, value: pincode.length),
                      ),
                    ],
                  ),
                ),
            ),
            Positioned.fill(
              top: (_orientation) ? 400: 50,
              bottom: 30,
              left: (_orientation) ? 50 : 450,
              right: 50,
              child: PinPad(
                height: 350,
                width: 350,
                pincode: pincode,
                onChange: (String value) async {
                  setState(() => pincode = value);
                  if (value.length == digits) {
                    if (await locator.get<LocalPinController>().checkPin(value)) {
                      //TODO: Goto Next Screen
                      MyFluroRouter.router.navigateTo(context, '/auth');
                    } else { //Colorize in red and Start shake animation
                      setState(() {
                        decoration = boxErrorStyle;
                        start = true;
                      });
                    }
                  };
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
