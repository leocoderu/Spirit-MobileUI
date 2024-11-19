// Import Flutter
import 'package:flutter/material.dart';
import 'package:spirit/pages/local_auth_page/local_widget/pin_pad.dart';
import 'package:spirit/pages/local_auth_page/local_widget/pin_screen.dart';
// Import Packages
//import 'package:flutter_svg/flutter_svg.dart';
//import 'package:spirit/fluro_router.dart';

// Import Modules
import 'package:spirit/src/shared/app_colors.dart';
import 'package:spirit/src/shared/font_style.dart';
//import 'package:spirit/src/shared/button_style.dart';
//import 'package:spirit/src/shared/font_style.dart';
import 'package:spirit/src/widgets/back_ground.dart';
import 'package:spirit/src/widgets/logo.dart';

class LocalAuthPage extends StatelessWidget {
  static const routeName = '/localauth';
  const LocalAuthPage({super.key});

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
                  ? ((_height - 139 - (_bottom * 0.822)) / 2) - 180 - 5 - 70
                  : ((_height - 139 - (_bottom * 0.822)) / 2) - 5 - 80,
            ),
            Positioned.fill(
                top: _orientation ? 280 : 230,
                bottom: _orientation ? 470: 30,
                //height: 100,
                left: (_orientation) ? (_width - 300)/2 : 50,
                right: (_orientation) ? (_width - 300)/2 : 450,
                child: Container(

                  color: Colors.deepPurpleAccent,
                  child: Column(
                    children: [
                      Container(
                        //color: Colors.deepOrange,
                        height: 40,
                        //width: 400,
                        child: Text('Enter your PIN', style: header1,),
                      ),
                      Container(
                        //color: Colors.deepPurpleAccent,
                        height: 50,
                        //width: 400,
                        //child: Text('* * * *', style: logoName,),
                        child: PinScreen(),
                      ),
                    ],
                  ),
                ),
              ),
            Positioned.fill(
              top: (_orientation) ? 320: 30,
              bottom: 30,
              left: (_orientation) ? 50 : 400,
              right: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PinPad(height: 350, width: 350,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
