import 'package:flutter/material.dart';

import 'package:auth_test/screens/home_screen.dart';
import 'package:auth_test/business/di/locator.dart';

void main() {
  setupServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter FaceID',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
