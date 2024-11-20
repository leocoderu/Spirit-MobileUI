class LocalPin {
  Future<String> getLocalPin() async {
    //TODO: Gets Local Pin from security Local storage with Hive
    //await _auth.canCheckBiometrics || await _auth.isDeviceSupported();
    return '1234';
  }

  Future<void> setLocalPin(String value) async {
    //TODO: Set Local Pin (value) to security Local storage with Hive
  }
}