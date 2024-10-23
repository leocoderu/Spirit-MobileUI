import 'package:flutter/material.dart';
class InputField extends StatefulWidget {
  const InputField({super.key,
    this.controller,
    this.keyboardType,
    this.label,
    //this.labelStyle,
    //this.labelPadding,
    //this.labelAlignment,
    //this.textStyle,
    //this.cursorColor,
    this.hintText,
    //this.hintStyle,
    this.helperText,
    //this.obscureText,
    this.showEye,
    //this.helperStyle,
  });

  final TextEditingController? controller;
  final TextInputType? keyboardType;

  final String? label;
  //final TextStyle? labelStyle;
  //final EdgeInsetsGeometry? labelPadding;
  //final Alignment? labelAlignment;

  //final TextStyle? textStyle;
  //final Color? cursorColor;

  final String? hintText;
  //final TextStyle? hintStyle;

  final String? helperText;
  //final TextStyle? helperStyle;
  //final bool? obscureText;

  final bool? showEye;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  //final ctrlLogin = TextEditingController();

  static const white100 = Color(0xFFFFFFFF);
  static const black100 = Color(0xFFF4F4F4);
  static const black200 = Color(0xFFC7C7C9);
  static const black300 = Color(0xFF908E93);
  //static const black400 = Color(0xFF58565C);
  //static const black500 = Color(0xFF201D26);

  final TextStyle labelStyle = TextStyle(color: black100, fontFamily: "Exo2", fontSize: 16.0,);
  final EdgeInsetsGeometry labelPadding = EdgeInsets.only(left: 5);
  final Alignment labelAlignment = Alignment.bottomLeft;
  final TextStyle textStyle = TextStyle(color: Color(0xFF201D26), fontFamily: "Exo2", fontSize: 20.0);
  final Color cursorColor = Colors.black;
  final TextStyle hintStyle = TextStyle(color: black300, fontFamily: "Exo2", fontSize: 20.0);
  final TextStyle helperStyle = TextStyle(color: black200, fontFamily: "Exo2", fontSize: 12.0);

  late bool _showPass; // = widget.obscureText ?? false;

  @override
  void initState() {
    _showPass = widget.showEye ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    InputDecoration txtDecor(bool showEye) {
      return InputDecoration(
        filled: false,
        fillColor: white100,

        //border: Border.none,
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
        //   borderSide: BorderSide(color: black300),
        // ),

        // focusedBorder: OutlineInputBorder(
        //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
        //     borderSide: BorderSide(color: black300)
        // ),
        //border: UnderlineInputBorder() ,
        //labelText: s,
        //labelStyle: TextStyle(color: black100, fontSize: 16.0),
        //hintText: widget.hintText,
        //hintStyle: hintStyle,

        //helperText: widget.helperText,
        //helperStyle: helperStyle,

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
              padding: labelPadding,
              alignment: labelAlignment,
              child: Text((widget.label != null) ? widget.label! : "", style: labelStyle),
            ) : SizedBox(),
          Container(
            width: double.infinity,
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              //color: white100,
              border: Border.all(color: black300, width: 1.0,),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.green,
                ),
                BoxShadow(
                  blurStyle: BlurStyle.inner,
                  color: Colors.redAccent,
                  spreadRadius: -5.0,
                  blurRadius: 2.0,
                ),
              ],
            ),
            // child: TextField(
            //   keyboardType: widget.keyboardType,
            //   controller: widget.controller,
            //   obscureText: _showPass,
            //   style: textStyle,
            //   cursorColor: cursorColor,
            //   decoration: txtDecor(widget.showEye ?? false),
            // ),
          ),

        ],
      )
    );
  }
}
