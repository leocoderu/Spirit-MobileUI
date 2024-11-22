import 'package:flutter/material.dart';

import 'package:auth_test/business/controller/local_auth_controller.dart';
import 'package:auth_test/business/di/locator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool authenticated = false;

  bool? biometric;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biometric ID example'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  final authenticate = await locator.get<LocalAuthController>().authUser();
                  setState(() => authenticated = authenticate);
                },
                child: const Text('Authenticate'),
            ),
            if (authenticated)
              const Text('You are authenticated'),
            if (authenticated)
              ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      authenticated = false;
                    });
                  },
                  child: const Text('Log off'),
              ),
            ElevatedButton(
                onPressed: () async {
                  biometric = await locator.get<LocalAuthController>().checkBio();
                },
                child: const Text('Get info'),
            ),
            if(biometric == null) const Text('Biometric ID unknown'),
            if(biometric != null)
              if(biometric!) const Text('Biometric ID available'),
            if(biometric != null)
              if(!biometric!) const Text('Biometric ID not available'),
          ],
        ),
      ),
    );
  }
}
