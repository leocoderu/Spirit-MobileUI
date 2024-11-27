import 'package:flutter/material.dart';
import 'package:spirit/src/shared/app_colors.dart';
import 'package:spirit/src/shared/font_style.dart';

class SwitchField extends StatelessWidget {
  const SwitchField({super.key, this.size, this.decoration, this.text, this.hint, this.state, this.onChange});

  final Size? size;
  final Decoration? decoration;

  final String? text;
  final String? hint;
  final bool?  state;
  final void Function(bool)? onChange;

  @override
  Widget build(BuildContext context) {
    return Card(
      //margin: EdgeInsets.all(20.0),
      elevation: 5,
      child: Container(
        height: 120,
        padding: EdgeInsets.all(20.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                //height: 60,
                //color: Colors.deepPurpleAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(width: double.infinity, child: Text(text ?? '', style: inputLabel)),
                    Container(width: double.infinity, child: Text(hint ?? '', style: inputHint)),
                  ],
                ),
              ),
            ),
            Container(
                alignment: Alignment.topLeft,
                //color: Colors.orange,
                //height: 120,

                child: Switch(
                  //thumbColor: WidgetStatePropertyAll(Gradient(colors: [])),
                  //thumbIcon: WidgetStatePropertyAll(Icon(Icons.recycling)),
                  trackOutlineColor: WidgetStatePropertyAll(Colors.black),
                  trackOutlineWidth: WidgetStatePropertyAll(1.0),
                  activeColor: whiteColor100,
                  activeTrackColor: greenColor300,
                  value: state ?? false,
                  onChanged: onChange != null ? (value) => onChange!(value) : null,
                ),
            ),
          ],
        ),
      ),
    );
  }
}
