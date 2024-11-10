//import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

import 'package:flutter/material.dart';
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
  static const white100 = Color(0xFFFFFFFF);
  static const black100 = Color(0xFFF4F4F4);
  static const black200 = Color(0xFFC7C7C9);
  static const black300 = Color(0xFF908E93);
  static const black400 = Color(0xFF58565C);
  static const black500 = Color(0xFF201D26);

  final TextStyle labelStyle = TextStyle(color: black100, fontFamily: "Exo2", fontSize: 16.0,);
  final EdgeInsetsGeometry labelPadding = EdgeInsets.only(left: 7);
  final Alignment labelAlignment = Alignment.bottomLeft;
  final TextStyle textStyle = TextStyle(color: black500, fontFamily: "Exo2", fontSize: 20.0);
  final Color cursorColor = black500;
  final TextStyle hintStyle = TextStyle(color: black300, fontFamily: "Exo2", fontSize: 20.0);
  final TextStyle helperStyle = TextStyle(color: black200, fontFamily: "Exo2", fontSize: 12.0);

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
              child: Text((widget.label != null) ? widget.label! : "", style: labelStyle),
            ) : SizedBox(),
          Container(
            width: double.infinity,
            height: 50.0,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              margin: EdgeInsets.symmetric(vertical: 2.0),
            decoration: BoxDecoration(
              color: white100,
              border: Border.all(color: black300, width: 1),
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [black200, white100],
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
                      fillColor: white100,
                      hintText: widget.hintText,
                      hintStyle: hintStyle,
                    ),
                  ),
                ),
                if (widget.showEye ?? false)
                  GestureDetector(
                    onTap: () => setState(() => _showPass = !_showPass),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(color: black400, _showPass ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),
              ],
            ),
          ),
          (widget.helperText != null) ?
            Container(
              padding: labelPadding,
              alignment: labelAlignment,
              child: Text(widget.helperText!, style: helperStyle),
            ) : SizedBox(),
        ],
      ),
    );
  }
}
