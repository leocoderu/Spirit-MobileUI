import 'package:flutter/material.dart';
import 'package:spirit/pages/widgets/input_field.dart';

class AuthPage extends StatefulWidget {
  static const routeName = '/auth';
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final ctrlLogin = TextEditingController();
  final ctrlPass = TextEditingController();

  final white100 = Color(0xFFFFFFFF);
  final black100 = Color(0xFFF4F4F4);
  final black200 = Color(0xFFC7C7C9);
  final black300 = Color(0xFF908E93);
  final black400 = Color(0xFF58565C);
  final black500 = Color(0xFF201D26);

  bool _showPass = false;

  @override
  Widget build(BuildContext context) {
    bool orientation = MediaQuery.of(context).orientation == Orientation.portrait;

    final txtStyle = TextStyle(color: Color(0xFF201D26), fontSize: 20.0);

    InputDecoration txtDecor(String s, bool showEye) {
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
        hintText: "Login",
        hintStyle: TextStyle(color: black300, fontSize: 20.0),

        helperText: "You should enter Login for Authorization",
        helperStyle: TextStyle(color: black200, fontSize: 12.0),

        suffixIcon: showEye ? GestureDetector(
          onTap: () => setState(() => _showPass = !_showPass),
          child: Icon(_showPass ? Icons.visibility : Icons.visibility_off),
        ) : null,
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Transform.rotate(
            angle: orientation ? -1.2 : -0.4,
            child: Transform.scale(
              scaleX: orientation ? 3 : 4,
              scaleY: orientation ? 1.5 : 2,
              child: Container(
                decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: orientation ? Alignment(0.3, 0.05) : Alignment(0.1, -0.05),
                      radius: orientation ? 0.5 : 0.35,
                      colors: <Color>[ Color(0xFFA3B3EB), Color(0xFF5267B2) ],
                      stops: [ 0.0, 1.0 ],
                    )
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 96,
                  child: Image.asset("assets/logo.png"),
                ),
                Container(
                  width: 320,
                  child: Column(
                    children: [
                      InputField(
                        keyboardType: TextInputType.visiblePassword,
                        label: 'Login',
                        //labelStyle: TextStyle(color: black100, fontSize: 16.0,),
                        //labelAlignment: Alignment.bottomLeft,
                        //labelPadding: EdgeInsets.only(left: 5),
                        //textStyle: TextStyle(color: Color(0xFF201D26), fontSize: 20.0),
                        //cursorColor: Colors.black,
                        hintText: "Login",
                        //hintStyle: TextStyle(color: black300, fontSize: 20.0),
                        helperText: "You should enter Login for Authorization",
                        //helperStyle: TextStyle(color: black200, fontSize: 12.0),
                      ),
                      // Container(
                      //   padding: EdgeInsets.only(left: 5),
                      //   alignment: Alignment.bottomLeft,
                      //   child: Text("Логин", style: TextStyle(color: black100, fontSize: 16.0,)),
                      // ),
                      // TextField(
                      //   keyboardType: TextInputType.visiblePassword,
                      //   controller: ctrlLogin,
                      //   style: txtStyle,
                      //   cursorColor: Colors.white,
                      //   decoration: txtDecor('Логин', false),
                      // ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        alignment: Alignment.bottomLeft,
                        child: Text("Пароль", style: TextStyle(color: black100, fontSize: 16.0,)),
                      ),
                      TextField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: ctrlPass,
                        obscureText: !_showPass,
                        style: txtStyle,
                        cursorColor: Colors.white,
                        decoration: txtDecor('Пароль', true),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
