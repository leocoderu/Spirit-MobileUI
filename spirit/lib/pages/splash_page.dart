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
  late double complete;

  @override
  void initState() {
    complete = 0.0;
    super.initState();
    getInit();
  }

  void getInit() async {
    final rcvPort1 = ReceivePort();
    await Isolate.spawn(init1, rcvPort1.sendPort);
    rcvPort1.listen((res) {
      setState(() => complete += 0.25);
      if (complete == 1) MyFluroRouter.router.navigateTo(context, '/auth', transition: TransitionType.inFromBottom);
    });

    final rcvPort2 = ReceivePort();
    await Isolate.spawn(init2, rcvPort2.sendPort);
    rcvPort2.listen((res) {
      setState(() => complete += 0.5);
      if (complete == 1) MyFluroRouter.router.navigateTo(context, '/auth', transition: TransitionType.inFromBottom);
    });

    final rcvPort3 = ReceivePort();
    await Isolate.spawn(init3, rcvPort3.sendPort);
    rcvPort3.listen((res) {
      setState(() => complete += 0.25);
      if (complete == 1) MyFluroRouter.router.navigateTo(context, '/auth', transition: TransitionType.inFromBottom);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            BackGround(),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 191,
                    child: Image.asset("assets/logo.png"),
                  ),
                  Text("Spirit", style: TextStyle(fontFamily: "Exo2", fontSize: 74, fontWeight: FontWeight.w400, color: Color(0xFFF4F4F4)),),
                  Container(
                    height: 6,
                    width: 300,
                    child: LinearProgressIndicator(
                      value: complete,
                      color: Color(0xFF63578C),
                      backgroundColor: Color(0xFFE6DDF5),
                      borderRadius: BorderRadius.all(Radius.circular(3.0)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}

void init1(SendPort sendPort) {
  double total = 0.0;
  //for (double i = 0; i < 50000000; i++) total += i;
  sendPort.send(total);
}

void init2(SendPort sendPort) {
  double total = 0.0;
  //for (double i = 0; i < 100000000; i++) total += i;
  sendPort.send(total);
}

void init3(SendPort sendPort) {
  double total = 0.0;
  //for (double i = 0; i < 5000000; i++) total += i;
  sendPort.send(total);
}