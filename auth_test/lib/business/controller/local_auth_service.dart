
import 'package:auth_test/business/di/locator.dart';
import 'package:auth_test/data/local_auth_service.dart';

class LocalAuthService {
  Future<bool> authUser() async {
    return locator.get<LocalAuth>().authenticate();
  }

  // Future<Null> logOut() async {
  //   locator.get<AuthRepo>().signOut();
  // }
}