import 'package:flutter/material.dart';
import 'package:spirit/pages/widgets/back_ground.dart';
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

  //late bool _showPass;

  @override
  void initState() {
    //_showPass = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackGround(),
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
                        controller: ctrlLogin,
                        keyboardType: TextInputType.visiblePassword,
                        label: 'Login',
                        hintText: "Login",
                        helperText: "You should enter Login for Authorization",
                      ),
                      SizedBox(height: 10),
                      InputField(
                        controller: ctrlPass,
                        keyboardType: TextInputType.visiblePassword,
                        label: 'Password',
                        hintText: 'Password',
                        helperText: "You should enter Password for Authorization",
                        //obscureText: false, //!_showPass,
                        showEye: true,
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
