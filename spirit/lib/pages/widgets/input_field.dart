import 'package:flutter/material.dart';
class InputField extends StatefulWidget {
  const InputField({super.key,
    this.keyboardType,
    this.label,
    this.labelStyle,
    this.labelPadding,
    this.labelAlignment,
    this.textStyle,
    this.cursorColor,
    this.hintText,
    this.hintStyle,
    this.helperText,
    this.helperStyle,
  });

  final TextInputType? keyboardType;

  final String? label;
  final TextStyle? labelStyle;
  final EdgeInsetsGeometry? labelPadding;
  final Alignment? labelAlignment;

  final TextStyle? textStyle;
  final Color? cursorColor;

  final String? hintText;
  final TextStyle? hintStyle;

  final String? helperText;
  final TextStyle? helperStyle;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final ctrlLogin = TextEditingController();

  final white100 = Color(0xFFFFFFFF);
  final black100 = Color(0xFFF4F4F4);
  final black200 = Color(0xFFC7C7C9);
  final black300 = Color(0xFF908E93);
  final black400 = Color(0xFF58565C);
  final black500 = Color(0xFF201D26);

  late bool _showPass = false;

  @override
  void initState() {
    _showPass = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    InputDecoration txtDecor(bool showEye) {
      return InputDecoration(
        filled: true,
        fillColor: white100,

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: black300),
        ),

        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: black300)
        ),
        //border: UnderlineInputBorder() ,
        //labelText: s,
        //labelStyle: TextStyle(color: black100, fontSize: 16.0),
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,

        helperText: widget.helperText,
        helperStyle: widget.helperStyle,

        suffixIcon: showEye ? GestureDetector(
          onTap: () => setState(() => _showPass = !_showPass),
          child: Icon(_showPass ? Icons.visibility : Icons.visibility_off),
        ) : null,
      );
    }

    return Container(
      child: Column(
        children: [
          (widget.label != null) ?
            Container(
              padding: widget.labelPadding,
              alignment: widget.labelAlignment,
              child: Text((widget.label != null) ? widget.label! : "", style: widget.labelStyle),
            ) : SizedBox(),
          TextField(
            keyboardType: widget.keyboardType,
            controller: ctrlLogin,
            style: widget.textStyle,
            cursorColor: widget.cursorColor,
            decoration: txtDecor(false),
          ),
        ],
      )
    );
  }
}
