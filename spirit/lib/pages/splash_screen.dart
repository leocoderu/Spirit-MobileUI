import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              color: Colors.amber,
              width: 200,
              height: 200,
              //child: Image.asset("assets/logo.png"),
            ),
            Text("Welcome to Spirit"),
            Container(
              color: Colors.green,
            ),
          ],
        ),
    );
  }
}
