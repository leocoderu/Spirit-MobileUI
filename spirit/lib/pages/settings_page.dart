import 'package:flutter/material.dart';
import 'package:spirit/src/widgets/switch_field.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = '/settings';
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SwitchField(),
          ],
        ),
      ),
    );
  }
}
