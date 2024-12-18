import 'package:flutter/material.dart';
import 'package:spirit/src/styles/app_colors.dart';
import 'package:spirit/src/styles/font_style.dart';
import 'package:spirit/src/widgets/switch_field/switch_widgets/switcher.dart';

class SwitchField extends StatelessWidget {
  const SwitchField({super.key, this.size, this.decoration, this.text, this.hint, this.state, required this.onChange});

  final Size? size;
  final Decoration? decoration;

  final String? text;
  final String? hint;
  final int?  state;
  //final void Function(int) onChange;
  final VoidCallback onChange;



  @override
  Widget build(BuildContext context) {
    return Card(
      //margin: EdgeInsets.all(20.0),
      elevation: 5,
      child: Container(
        height: 120,
        //width: 200,
        padding: EdgeInsets.all(20.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Container(
                //height: 60,
                //color: Colors.deepPurpleAccent,
                // child: Column(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   mainAxisSize: MainAxisSize.max,
                //   children: [
                //     Container(width: double.infinity, child: Text(text ?? '', style: inputLabel)),
                //     Container(width: double.infinity, child: Text(hint ?? '', style: inputHint)),
                //   ],
                // ),
              ),
            ),
            Container(
              color: Colors.orange,
              //height: 120,
              width: 200,
              alignment: Alignment.topLeft,
              child: Switcher(
                position: state,
                onChange: onChange,
                // onChange: (v) {
                //   print('switch_field gets: $v');
                //   onChange(v);
                // },
              ),
                // child: Switch(
                //   //thumbColor: WidgetStatePropertyAll(Gradient(colors: [])),
                //   //thumbIcon: WidgetStatePropertyAll(Icon(Icons.recycling)),
                //   trackOutlineColor: WidgetStatePropertyAll(Colors.black),
                //   trackOutlineWidth: WidgetStatePropertyAll(1.0),
                //   activeColor: whiteColor100,
                //   activeTrackColor: greenColor300,
                //   value: state ?? false,
                //   onChanged: onChange != null ? (value) => onChange!(value) : null,
                // ),
            ),
          ],
        ),
      ),
    );
  }
}
