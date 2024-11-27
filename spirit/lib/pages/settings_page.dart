import 'dart:isolate';

import 'package:business_layer/business_layer.dart';
import 'package:flutter/material.dart';
import 'package:spirit/src/widgets/switch_field/switch_field.dart';

class SettingsPage extends StatefulWidget {
  static const routeName = '/settings';
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  int local_auth = 0;

  Future<double> _hardFunc() async {
    double total = 0.0;
    for (double i = 0; i < 500000000; i++) total += i;
    return await total;
  }

  void _onChange() async {
    print('1');
    int _local_auth = local_auth == 0 ? 1 : 0 ;
    setState(() => local_auth = 2);
    print('2');
    await _hardFunc();
    print('3');
    //     .then((v) => {
    //   setState(() => local_auth = _local_auth),
    // });
    setState(() => local_auth = _local_auth);
    print('4');

    //final rcvPort1 = ReceivePort();
    //await Isolate.spawn(locator.get<InfoController>().getInfo1, rcvPort1.sendPort);
    // rcvPort1.listen((res) {
    //   print('work complete: $res');
    //   setState(() => local_auth = 1);
    // });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SwitchField(
                  //text: 'Локальная аутентификация',
                  text: 'Local Authentication',
                  hint: 'Защита входа в систему с использованием биометрии и PIN кода',
                  state: local_auth,
                  onChange: _onChange,
                  // onChange: (v) {
                  //   print('settings page gets: $v');
                  //   setState(() {
                  //     local_auth = v;
                  //     print('value local auth: $local_auth');
                  //   });
                  // },
                ),
                SwitchField(
                  //text: 'Локальная аутентификация',
                  text: 'Local Authentication',
                  hint: 'Защита входа в систему с использованием биометрии и PIN кода',
                  state: local_auth,
                  onChange: _onChange,

                ),
                SwitchField(
                  //text: 'Локальная аутентификация',
                  text: 'Local Authentication',
                  hint: 'Защита входа в систему с использованием биометрии и PIN кода',
                  state: local_auth,
                  onChange: _onChange,

                ),
                SwitchField(
                  //text: 'Локальная аутентификация',
                  text: 'Local Authentication',
                  hint: 'Защита входа в систему с использованием биометрии и PIN кода',
                  state: local_auth,
                  onChange: _onChange,

                ),
                SwitchField(
                  //text: 'Локальная аутентификация',
                  text: 'Local Authentication',
                  hint: 'Защита входа в систему с использованием биометрии и PIN кода',
                  state: local_auth,
                  onChange: _onChange,

                ),
                SwitchField(
                  //text: 'Локальная аутентификация',
                  text: 'Local Authentication',
                  hint: 'Защита входа в систему с использованием биометрии и PIN кода',
                  state: local_auth,
                  onChange: _onChange,

                ),
                SwitchField(
                  //text: 'Локальная аутентификация',
                  text: 'Local Authentication',
                  hint: 'Защита входа в систему с использованием биометрии и PIN кода',
                  state: local_auth,
                  onChange: _onChange,

                ),
                SwitchField(
                  //text: 'Локальная аутентификация',
                  text: 'Local Authentication',
                  hint: 'Защита входа в систему с использованием биометрии и PIN кода',
                  state: local_auth,
                  onChange: _onChange,

                ),
                SwitchField(
                  //text: 'Локальная аутентификация',
                  text: 'Local Authentication',
                  hint: 'Защита входа в систему с использованием биометрии и PIN кода',
                  state: local_auth,
                  onChange: _onChange,

                ),
              ],
            ),
          ),
      ),
    );
  }
}
