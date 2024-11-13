import 'package:flutter/material.dart';

class FingerPrint extends StatelessWidget {
  const FingerPrint({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin:  EdgeInsets.only(left: 45,right: 45, top: 240),
        //color: Colors.redAccent,
        width: 320,
        height: 400,
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.topCenter,
                child: Image.asset('assets/system/images/finger.png', width: 279, height: 279,),
              ),
            ),
            const Text('Place you Finger on Scanner',
              style: TextStyle(fontFamily: 'Exo2', fontSize: 20,
                  color: Color.fromRGBO(244,244,244, 1),),
            ),
          ],
        ),
      ),
    );
  }
}
