import 'package:flutter/material.dart';
import 'package:spirit/src/shared/app_colors.dart';
import 'package:spirit/src/shared/font_style.dart';

class SwitchField extends StatefulWidget {
  const SwitchField({super.key, this.size, this.decoration});

  final Size? size;
  final Decoration? decoration;

  @override
  State<SwitchField> createState() => _SwitchFieldState();
}

class _SwitchFieldState extends State<SwitchField> {

  bool sw = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20.0),
      elevation: 5,
      child: Container(
        //height: 436,
        padding: EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 60,
                //color: Colors.deepPurpleAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('Switcher text', style: header2,),
                    Text('Switcher description text', style: inputLabel,),
                  ],
                ),
              ),
            ),
            Container(
              height: 60,
              alignment: Alignment.topLeft,
              //color: Colors.green,
              child: Container(
                child: Switch(
                  activeColor: whiteColor100,
                  activeTrackColor: greenColor300,
                  value: sw,
                  onChanged: (value) => setState(() {
                    sw = value;
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
