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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        child: Stack(
          children: [
              BackGround(),
              Center(
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                          width: 320,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 96,
                                child: Image.asset("assets/logo.png"),
                              ),
                              SizedBox(height: 10),
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
                              SizedBox(height: 25),
                              ElevatedButton(
                                style: ButtonStyle(
                                  minimumSize: WidgetStatePropertyAll(Size(320, 54)),
                                  maximumSize: WidgetStatePropertyAll(Size(320, 54)),
                                  elevation: WidgetStatePropertyAll(5.0),
                                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                                  backgroundColor: WidgetStatePropertyAll(Color(0xFF859AE5)),
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      )
                                  ),
                                ),
                                onPressed: () {},
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        )
                    ),
                    TextButton(
                      style: ButtonStyle(
                        minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50)),
                        maximumSize: WidgetStatePropertyAll(Size(double.infinity, 50)),
                        foregroundColor: WidgetStatePropertyAll(Colors.white60),
                      ),
                      onPressed: () {},
                      child: Text('Registration in system'),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
