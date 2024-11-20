// Import Flutter
import 'package:business_layer/business_layer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:spirit/pages/local_auth_page/local_widget/pin_pad.dart';
import 'package:spirit/pages/local_auth_page/local_widget/pin_screen.dart';
// Import Packages
//import 'package:spirit/fluro_router.dart';

// Import Modules
import 'package:spirit/src/shared/app_colors.dart';
import 'package:spirit/src/shared/font_style.dart';
//import 'package:spirit/src/shared/button_style.dart';
//import 'package:spirit/src/shared/font_style.dart';
import 'package:spirit/src/widgets/back_ground.dart';
import 'package:spirit/src/widgets/logo.dart';
import 'package:spirit/src/widgets/shake_widget.dart';

class LocalAuthPage extends StatefulWidget {
  static const routeName = '/localauth';
  const LocalAuthPage({super.key});

  @override
  State<LocalAuthPage> createState() => _LocalAuthPageState();
}

class _LocalAuthPageState extends State<LocalAuthPage> {

  String pincode = '';
  bool   shakeStart = false;
  Color  borderColor = blackColor300;
  Color  backColor1 = blackColor200;
  Color  backColor2 = whiteColor100;


  void clearValues() {
    setState(() {
      borderColor = redColor200;
      backColor1 = redColor200;
      backColor2 = redColor100;
      shakeStart = true;
    });


    //TODO: Start shake animation
    // setState(() {
    //   pincode = '';
    // });
  }

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
              X: _orientation ? ((_width - 96) / 2) : ((_width - 96) / 2) - 200,
              Y: _orientation
                  ? ((_height - 139 - (_bottom * 0.822)) / 2) - 180 - 5 - 90
                  : ((_height - 139 - (_bottom * 0.822)) / 2) - 5 - 80,
            ),
            Positioned.fill(
                top: _orientation ? 240 : 230,
                bottom: _orientation ? 420: 30,
                left: (_orientation) ? (_width - 300)/2 : 50,
                right: (_orientation) ? (_width - 300)/2 : 450,
                child: Container(
                  //color: Colors.deepPurpleAccent,
                  child: Column(
                    children: [
                      Container(
                        //color: Colors.deepOrange,
                        height: 80,
                        child: Text('Enter your PIN', style: header1.copyWith(color: blackColor100),),
                      ),
                      // ShakeAnimatedWidget(
                      //   enabled: this._enabled,
                      //   duration: Duration(milliseconds: 1500),
                      //   shakeAngle: Rotation.deg(z: 40),
                      //   curve: Curves.linear,
                      //   child: FlutterLogo(
                      //     style: FlutterLogoStyle.stacked,
                      //   ),
                      // ),
                      ShakeWidget(
                          shakeStart: shakeStart,
                          duration: Duration(seconds: 5),
                          child: PinScreen(height: 50, width: 400, borderColor: borderColor, backgroundColor1: backColor1, backgroundColor2: backColor2, value: pincode),
                          onEnd: () {
                            setState(() {
                              pincode = '';
                              borderColor = blackColor300;
                              backColor1 = blackColor200;
                              backColor2 = whiteColor100;
                              shakeStart = false;
                            });
                          },
                        //TODO: After animation complete clear pincode value state
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

                  if (value.length == 4) {
                    bool res  = await locator.get<LocalPinController>().checkPin(value);
                    if (await locator.get<LocalPinController>().checkPin(value)) {
                      //TODO: Goto Next Screen
                    } else {
                      //TODO: Colorize in red and Start shake animation
                      clearValues();
                    }
                    //if (kDebugMode) debugPrint('PinCode $pincode ${res ? ' is true :)' : 'is false :('}');
                    //
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
