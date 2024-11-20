import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';

class LocalAuth {
  final _auth = LocalAuthentication();
  Future<bool> _canAuthenticate() async =>
      await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

  Future<bool> authenticate() async {
    try {
      if (!await _canAuthenticate()) return false;

      return await _auth.authenticate(
        authMessages: const [
          AndroidAuthMessages(
            signInTitle: 'Sign In',
            cancelButton: 'No Thanks',
          ),
          IOSAuthMessages(
            cancelButton: 'No Thanks',
          ),
        ],
        localizedReason: 'Use Face ID to authenticate',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: false,
          sensitiveTransaction: true,
          biometricOnly: true,
        ),
      );
    } catch (e) {
      debugPrint('error: $e');
      return false;
    }
  }
}