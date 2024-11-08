import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    final bool _orientation = MediaQuery.of(context).orientation == Orientation.portrait;
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: PopScope(
        canPop: false,
        child: Stack(
          children: [
            BackGround(),
            Positioned(
                left: _orientation ? ((_width - 96) / 2) : ((_width - 96) / 2) - 170,
                top:  _orientation ? ((_height - 177 - 10) / 2) - 170 : ((_height - 177 - 10) / 2),
                child: Container(
                  width: 96,
                  child: SvgPicture.asset('assets/logo.svg'),
                ),
            ),
            Positioned(
              left: _orientation ? ((_width - 320) / 2) : ((_width - 320) / 2) + 170,
              width: 320,
              height: _height,
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                        width: 320,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (_orientation) SizedBox(height: 50),
                            InputField(
                              controller: ctrlLogin,
                              keyboardType: TextInputType.visiblePassword,
                              label: 'Login',
                              hintText: "Login",
                              helperText: "You should enter Login for Authorization",
                            ),
                            SizedBox(height: 5),
                            InputField(
                              controller: ctrlPass,
                              keyboardType: TextInputType.visiblePassword,
                              label: 'Password',
                              hintText: 'Password',
                              helperText: "You should enter Password for Authorization",
                              //obscureText: false, //!_showPass,
                              showEye: true,
                            ),
                            SizedBox(height: 15),
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
                      minimumSize: WidgetStatePropertyAll(Size(320, 50)),
                      maximumSize: WidgetStatePropertyAll(Size(320, 50)),
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
