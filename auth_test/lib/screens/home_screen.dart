import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

import 'package:auth_test/business/controller/local_auth_service.dart';
import 'package:auth_test/business/di/locator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool authenticated = false;

  final LocalAuthentication auth = LocalAuthentication();

  late int strongID;
  late int faceID;
  late int fingerprint;

  @override
  void initState() {
    strongID = 0;
    faceID = 0;
    fingerprint = 0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Face ID example'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  final authenticate = await locator.get<LocalAuthService>().authUser();
                  setState(() {
                    authenticated = authenticate;
                  });
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
                  //final auth = await LocalAuth.authenticate();
                  final List<BiometricType> availableBiometrics =
                      await auth.getAvailableBiometrics();

                  if (availableBiometrics.isNotEmpty) {
                    if (kDebugMode) debugPrint('Some biometrics are enrolled.');

                    setState(() {
                      strongID    = (availableBiometrics.contains(BiometricType.strong)) ? 1 : 2;
                      faceID      = (availableBiometrics.contains(BiometricType.face)) ? 1 : 2;
                      fingerprint = (availableBiometrics.contains(BiometricType.fingerprint)) ? 1 : 2;
                    });

                  } else {
                    if (kDebugMode) debugPrint('No available biometrics.');
                  }

                  // if (availableBiometrics.contains(BiometricType.strong) ||
                  //     availableBiometrics.contains(BiometricType.face)) {
                  //   debugPrint('Specific types of biometrics are available.');
                  //   // Use checks like this with caution!
                  // }
                },
                child: const Text('Get info'),
            ),
            if(strongID == 0) const Text('StrongID unknown'),
            if(strongID == 1) const Text('StrongID are available'),
            if(strongID == 2) const Text('StrongID are not available'),

            if(faceID == 0) const Text('FaceID unknown'),
            if(faceID == 1) const Text('FaceID are available'),
            if(faceID == 2) const Text('FaceID are not available'),

            if(fingerprint == 0) const Text('Fingerprint unknown'),
            if(fingerprint == 1) const Text('Fingerprint are available'),
            if(fingerprint == 2) const Text('Fingerprint are not available'),

          ],
        ),
      ),
    );
  }
}
