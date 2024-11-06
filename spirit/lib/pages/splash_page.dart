// Import Dart Isolate
import 'dart:isolate';

// Import Flutter
import 'package:flutter/material.dart';

// Import Modules
import 'package:fluro/fluro.dart';

// Import Packages
import 'package:spirit/fluro_router.dart';
import 'package:spirit/pages/widgets/back_ground.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double _complete = 0.0;
  double _sizeLogo = 191.0;
  double _sizeBox  = 78.0;
  double _opacityBox = 1.0;

  bool   _toggle   = false;

  @override
  void initState() {
    super.initState();
    getInit();
  }

  void _nextPage(){
    setState(() {
      _sizeLogo = 96.0;
      _sizeBox = 338.125;
      _opacityBox = 0.0;
    });
    //MyFluroRouter.router.navigateTo(context, '/auth', transition: TransitionType.fadeIn);
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
    return Scaffold(
      body:
        Stack(
         children: [
           BackGround(),
           // Center(
           //   child:
           //    Column(
           //      mainAxisAlignment: MainAxisAlignment.center,
           //     children: [
           //        Container(
           //          height: 191.0,
           //          child: AnimatedContainer(
           //            curve: Curves.linear,
           //            duration: const Duration(milliseconds: 500),
           //            height: _sizeLogo,
           //            width: _sizeLogo,
           //            child: Image.asset("assets/logo.png",),
           //            onEnd: () {
           //              MyFluroRouter.router.navigateTo(context, '/auth', transition: TransitionType.fadeIn, transitionDuration: const Duration(microseconds: 500));
           //            },
           //          ),
           //        ),
           //        AnimatedOpacity(
           //            opacity: _opacityBox,
           //            duration: const Duration(milliseconds: 500),
           //            child: AnimatedContainer(
           //              duration: const Duration(milliseconds: 500),
           //              height: _sizeBox,
           //              child: Column(
           //                children: [
           //                  Text("Spirit", style: TextStyle(fontFamily: "Exo2", fontSize: 50, fontWeight: FontWeight.w400, color: Color(0xFFF4F4F4)),), //fontSize: 74
           //                  Container(
           //                    height: 6,
           //                    width: 300,
           //                    child: LinearProgressIndicator(
           //                      value: _complete,
           //                      color: Color(0xFF63578C),
           //                      backgroundColor: Color(0xFFE6DDF5),
           //                      borderRadius: BorderRadius.all(Radius.circular(3.0)),
           //                    ),
           //                  ),
           //                ],
           //              ),
           //            ),
           //        )
           //     ],
           //    ),
           //  ),
          ],
        ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       _toggle = !_toggle;
      //       _sizeLogo = _sizeLogo == 191.0 ? 96.0 : 191.0;
      //     });
      //   },
      //   tooltip: 'Start anime',
      //   child: const Icon(Icons.add),
      // ),
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