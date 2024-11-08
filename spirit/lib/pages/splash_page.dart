// Import Dart Isolate
import 'dart:isolate';

// Import Flutter
import 'package:flutter/material.dart';

// Import Modules
import 'package:fluro/fluro.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  double _sizeBox  = 85.0;
  double _opacityBox = 1.0;
  double _opacityBackground = 1.0;
  double _opacityLogo = 0.99;

  //bool   _toggle   = false;
  //late AssetImage assetLogo;

  @override
  void initState() {
    super.initState();
    //assetLogo = SvgPicture.asset('assets/logo.svg') as AssetImage; // AssetImage('assets/logo.svg');

    Future.delayed(Duration(milliseconds: 1)).then((value) => setState(() {
      _opacityLogo = 1.0;
      //_opacityBackground = 1.0;
    }));

    getInit();
  }

  // Future<void> loadImage(String imagePath) async {
  //     await precacheImage(assetLogo, context);
  // }

  @override
  void didChangeDependencies() {
    // setState(() {
    //    _opacityLogo = 1.0;
    // });
    //loadImage('assets/logo.png');
    super.didChangeDependencies();
  }


  //@override
  //void didChangeDependencies() {
    //assetLogo = AssetImage('assets/logo.png');
    //precacheImage(assetLogo, context);
    //super.didChangeDependencies();
 // }

  void _nextPage(){
    setState(() {
      _sizeLogo = 96.0;
      _sizeBox = 347; //345
      _opacityBox = 0.0;
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

  Widget logo() {
    return Container(
      alignment: Alignment.center,
      //height: 191.0,
      child:
      AnimatedOpacity(
        opacity: _opacityLogo,
        duration: const Duration(seconds: 5),
        child: AnimatedContainer(
          curve: Curves.linear,
          duration: const Duration(milliseconds: 500),
          width: _sizeLogo,
          //child: Image.asset("assets/logo.png",),
          //child: Image(image: assetLogo),
          child: SvgPicture.asset('assets/logo.svg'),
          onEnd: () {
            //MyFluroRouter.router.navigateTo(context, '/auth', transition: TransitionType.fadeIn, transitionDuration: const Duration(microseconds: 500));
          },
        ),
        // onEnd: () {
        //   setState(() {
        //     _opacityBackground = 1.0;
        //   });
        // },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //loadImage('assets/logo.png');
    return Scaffold(
      body:
        Stack(
         children: <Widget>[
           //BackGround(),
           AnimatedOpacity(
             opacity: _opacityBackground,
             duration: const Duration(seconds: 1),
             child: BackGround(),
           ),
           logo(),
           // Container(
           //   alignment: Alignment.center,
           //   //height: 191.0,
           //   child: AnimatedContainer(
           //     curve: Curves.linear,
           //     duration: const Duration(milliseconds: 500),
           //     //height: _sizeLogo,
           //     width: _sizeLogo,
           //     child: Image.asset("assets/logo.png",),
           //     onEnd: () {
           //       //MyFluroRouter.router.navigateTo(context, '/auth', transition: TransitionType.fadeIn, transitionDuration: const Duration(microseconds: 500));
           //     },
           //   ),
           // ),
           Center(
             child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
               children: [
                  // Container(
                  //   height: 191.0,
                  //   child: AnimatedContainer(
                  //     curve: Curves.linear,
                  //     duration: const Duration(milliseconds: 500),
                  //     height: _sizeLogo,
                  //     width: _sizeLogo,
                  //     child: Image.asset("assets/logo.png",),
                  //     onEnd: () {
                  //       MyFluroRouter.router.navigateTo(context, '/auth', transition: TransitionType.fadeIn, transitionDuration: const Duration(microseconds: 500));
                  //     },
                  //   ),
                  // ),
                  // AnimatedOpacity(
                  //     opacity: _opacityBox,
                  //     duration: const Duration(milliseconds: 500),
                  //     child: AnimatedContainer(
                  //       duration: const Duration(milliseconds: 500),
                  //       height: _sizeBox,
                  //       child: Column(
                  //         children: [
                  //           Text("Spirit", style: TextStyle(fontFamily: "Exo2", fontSize: 50, fontWeight: FontWeight.w400, color: Color(0xFFF4F4F4)),), //fontSize: 74
                  //           Container(
                  //             height: 6,
                  //             width: 300,
                  //             child: LinearProgressIndicator(
                  //               value: _complete,
                  //               color: Color(0xFF63578C),
                  //               backgroundColor: Color(0xFFE6DDF5),
                  //               borderRadius: BorderRadius.all(Radius.circular(3.0)),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  // )
               ],
              ),
            ),
          ],
        ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       //_opacityBackground = _opacityBackground == 0.0 ? 1.0 : 0.0;
      //       _opacityLogo = _opacityLogo == 0.0 ? 1.0 : 0.0;
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