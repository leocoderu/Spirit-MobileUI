import 'package:auth_test/business/di/locator.dart';
import 'package:auth_test/data/local_auth.dart';

class LocalAuthController {
  Future<bool> checkBio() async => await locator.get<LocalAuth>().checkBio();
  Future<bool> authUser() async => await locator.get<LocalAuth>().authenticate();
}