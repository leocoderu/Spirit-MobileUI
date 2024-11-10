import 'package:flutter/material.dart';
import 'package:spirit/pages/widgets/input_field.dart';

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
              style: ButtonStyle(
                minimumSize: WidgetStatePropertyAll(Size(320, 60)),
                maximumSize: WidgetStatePropertyAll(Size(320, 60)),
                elevation: WidgetStatePropertyAll(5.0),
                foregroundColor: WidgetStatePropertyAll(Colors.white),
                backgroundColor: WidgetStatePropertyAll(Color(0xFF859AE5)),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              onPressed: null,
              child: Text('OK', style: TextStyle(fontFamily: "Exo2", fontSize: 18),),
            ),
          ],
        ),
      ),
    );
  }
}
