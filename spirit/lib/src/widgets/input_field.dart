import 'package:flutter/material.dart';

import 'package:spirit/src/shared/app_colors.dart';
import 'package:spirit/src/shared/font_style.dart';

class InputField extends StatefulWidget {
  const InputField({super.key,
    this.controller,
    this.keyboardType,
    this.padding,
    this.label,
    this.hintText,
    this.helperText,
    this.showEye,
  });

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? padding;
  final String? label;
  final String? hintText;
  final String? helperText;
  final bool? showEye;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final EdgeInsetsGeometry labelPadding = EdgeInsets.only(left: 7);
  final Alignment labelAlignment = Alignment.bottomLeft;
  final Color cursorColor = blackColor500;

  late bool _showPass;

  @override
  void initState() {
    _showPass = widget.showEye ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding ?? EdgeInsets.all(0.0),
      child: Column(
        children: [
          (widget.label != null) ?
            Container(
              padding: labelPadding,
              alignment: labelAlignment,
              child: Text((widget.label != null) ? widget.label! : "",
                  style: inputLabel.copyWith(color: blackColor100),),
            ) : SizedBox(),
          Container(
            width: double.infinity,
            height: 50.0,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              margin: EdgeInsets.symmetric(vertical: 2.0),
            decoration: BoxDecoration(
              color: whiteColor100,
              border: Border.all(color: blackColor300, width: 1),
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [blackColor200, whiteColor100],
                stops: [0, 0.22],
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: widget.controller,
                    obscureText: _showPass,
                    decoration: InputDecoration.collapsed(
                      fillColor: whiteColor100,
                      hintText: widget.hintText,
                      hintStyle: inputText.copyWith(color: blackColor300),
                    ),
                  ),
                ),
                if (widget.showEye ?? false)
                  GestureDetector(
                    onTap: () => setState(() => _showPass = !_showPass),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(color: blackColor400, _showPass ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),
              ],
            ),
          ),
          (widget.helperText != null) ?
            Container(
              padding: labelPadding,
              alignment: labelAlignment,
              child: Text(widget.helperText!, style: inputHint.copyWith(color: blackColor200)),
            ) : SizedBox(),
        ],
      ),
    );
  }
}