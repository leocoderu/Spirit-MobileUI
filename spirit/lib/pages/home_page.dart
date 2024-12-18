import "dart:io";

import "package:flutter/material.dart";
import "package:spirit/fluro_router.dart";

import "package:spirit/src/styles/app_colors.dart";
import "package:spirit/src/styles/button_style.dart";
import "package:spirit/src/styles/font_style.dart";

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _cnt = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Home Page"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => MyFluroRouter.router.navigateTo(context, '/settings'),
              icon: Icon(Icons.settings),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(height: 300,),
            ElevatedButton(
              style: elevatedButtonDefaultStyle.copyWith(
                minimumSize: WidgetStatePropertyAll(Size(250.0, 50.0)),
              ),
              onPressed: ()=> exit(0),
              child: Text('Exit', style: elevatedButtonText),
            ),
          ],
        ),
      ),
      body: PopScope(
        canPop: false,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Tap this button many times:'),
                Text('$_cnt', style: Theme.of(context).textTheme.headlineMedium),
              ],
            ),
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _cnt++),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
