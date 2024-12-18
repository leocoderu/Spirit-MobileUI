import 'package:flutter/material.dart';
import 'package:spirit/fluro_router.dart';
import 'package:spirit/src/styles/app_colors.dart';
import 'package:spirit/src/styles/button_style.dart';
import 'package:spirit/src/styles/font_style.dart';
import 'package:spirit/src/widgets/input_field.dart';

class LoginPass extends StatefulWidget {
  const LoginPass({super.key});

  @override
  State<LoginPass> createState() => _LoginPassState();
}

class _LoginPassState extends State<LoginPass> {
  final ctrlLogin = TextEditingController();
  final ctrlPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 30),
        margin:  EdgeInsets.symmetric(horizontal: 45),
        //color: Colors.deepPurpleAccent,
        width: 320,
        child: Column(
          children: [
            InputField(
              padding: EdgeInsets.only(bottom: 5),
              controller: ctrlLogin,
              keyboardType: TextInputType.visiblePassword,
              label: 'Login',
              hintText: "Login",
              helperText: "You should enter Login for Authorization",
            ),
            InputField(
              padding: EdgeInsets.only(bottom: 15),
              controller: ctrlPass,
              keyboardType: TextInputType.visiblePassword,
              label: 'Password',
              hintText: 'Password',
              helperText: "You should enter Password for Authorization",
              showEye: true,
            ),
            ElevatedButton(
              style: elevatedButtonDefaultStyle,
              onPressed: () { MyFluroRouter.router.navigateTo(context, '/home');}, //null,
              child: Text('OK', style: elevatedButtonText),
            ),
          ],
        ),
      ),
    );
  }
}
