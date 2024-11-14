// Import Dart Isolate
import 'dart:isolate';

// Import Flutter
import 'package:flutter/material.dart';

// Import Modules
import 'package:fluro/fluro.dart';

// Import Packages
import 'package:spirit/fluro_router.dart';
import 'package:spirit/pages/auth_page/auth_widgets/login_pass.dart';
import 'package:spirit/src/shared/app_colors.dart';
import 'package:spirit/src/shared/button_style.dart';
import 'package:spirit/src/shared/font_style.dart';
import 'package:spirit/src/widgets/back_ground.dart';
import 'package:spirit/src/widgets/logo.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double _complete = 0.0;
  double _widthLogo = 150.0;
  double _offsetLogo = 0.0;
  double _opacityBox = 0.0;
  double _opacityNextBox = 0.0;
  double _backgroundOpacity = 0.0;

  final _duration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    Future<void>.delayed(_duration).then((value) {
      setState(() {
        _opacityBox = 1.0;
        _backgroundOpacity = 1.0;
      });
    });
  }

  void _nextPage(){
    setState(() {
      _widthLogo = 96.0;
      _offsetLogo = 180.0;
    });
  }

  void getInit() async {
    final rcvPort1 = ReceivePort();
    await Isolate.spawn(init1, rcvPort1.sendPort);
    rcvPort1.listen((res) {
      setState(() => _complete += 0.25);
      if (_complete == 1) _nextPage();
    });

    final rcvPort2 = ReceivePort();
    await Isolate.spawn(init2, rcvPort2.sendPort);
    rcvPort2.listen((res) {
      setState(() => _complete += 0.5);
      if (_complete == 1) _nextPage();
    });

    final rcvPort3 = ReceivePort();
    await Isolate.spawn(init3, rcvPort3.sendPort);
    rcvPort3.listen((res) {
      setState(() => _complete += 0.25);
      if (_complete == 1) _nextPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool _orientation = MediaQuery.of(context).orientation == Orientation.portrait;
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: mainColor400,
        body: Stack(
          children: <Widget>[
            AnimatedOpacity(
              opacity: _backgroundOpacity,
              duration: _duration,
              child: BackGround(firstColor: mainColor100, secondColor: mainColor400),
              onEnd: () {
                getInit();
              },
            ),
            Positioned(
              left: (_width - 300) / 2,
              top:  (_height - 58) / 2 + 100,
              child: AnimatedOpacity(
                opacity: _opacityBox,
                duration: _duration,
                child: Column(
                  children: [
                    Text("Spirit", style: logoName.copyWith(color: blackColor100)),
                    Container(
                      height: 5,
                      width: 300,
                      child: LinearProgressIndicator(
                        value: _complete,
                        color: mainColor400,
                        backgroundColor: blackColor100,
                        borderRadius: BorderRadius.all(Radius.circular(3.0)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                //color: Colors.deepOrange,
                child: AnimatedOpacity(
                    opacity: _opacityNextBox,
                    duration: _duration,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            alignment: _orientation? Alignment.center : Alignment.centerRight,
                            //color: Colors.green,
                            child:  LoginPass(),
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
                    onEnd: () {
                      MyFluroRouter.router.navigateTo(context, '/auth', transition: TransitionType.fadeIn); //, transitionDuration: const Duration(microseconds: 10));
                    },
                ),
              ),
            ),
            Logo(
                widthLogo: _widthLogo,
                X: ((_width  - _widthLogo)  / 2),
                Y: ((_height  - 139)  / 2) - 5,
                offset: _offsetLogo,
                duration: _duration,
                onEnd: () {
                  setState(() {
                    _opacityBox = 0.0;
                    _opacityNextBox = 1.0;
                  });
                },
            ),
          ],
        ),
    );
  }
}

void init1(SendPort sendPort) {
  double total = 0.0;
  for (double i = 0; i < 50000000; i++) total += i;
  sendPort.send(total);
}

void init2(SendPort sendPort) {
  double total = 0.0;
  for (double i = 0; i < 100000000; i++) total += i;
  sendPort.send(total);
}

void init3(SendPort sendPort) {
  double total = 0.0;
  for (double i = 0; i < 5000000; i++) total += i;
  sendPort.send(total);
}