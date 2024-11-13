// Import Flutter
import 'package:flutter/material.dart';
// Import Packages
import 'package:flutter_svg/flutter_svg.dart';
// Import Modules
import 'package:spirit/pages/auth_page/auth_widgets/finger_print.dart';
import 'package:spirit/pages/auth_page/auth_widgets/login_pass.dart';
import 'package:spirit/pages/widgets/back_ground.dart';

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
            BackGround(),
            Positioned(
                left: _orientation ? ((_width - 96) / 2) : ((_width - 96) / 2) - 180,
                top:  _orientation
                    ? ((_height - 139 - (_bottom * 0.822)) / 2) - 180 - 5
                    : ((_height - 139 - (_bottom * 0.822)) / 2) - 5,
                child: Container(
                  width: 96,
                  child: SvgPicture.asset('assets/system/svg/logo.svg'),
                ),
            ),
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      alignment: _orientation? Alignment.center : Alignment.centerRight,
                      //color: Colors.green,
                      child: FingerPrint(),
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
                      style: ButtonStyle(
                        minimumSize: WidgetStatePropertyAll(Size(320, 50)),
                        maximumSize: WidgetStatePropertyAll(Size(320, 50)),
                        foregroundColor: WidgetStatePropertyAll(Colors.white60),
                      ),
                      onPressed: null,
                      child: Text('Registration in the system',
                        style: TextStyle(
                            fontFamily: "Exo2",
                            fontSize: 16,
                            shadows: [
                              Shadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.5),
                                  offset: Offset(2, 2),
                                  blurRadius: 3,
                              ),
                            ],
                        ),
                      ),
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
