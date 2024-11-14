
import 'package:auth_test/business/di/locator.dart';
import 'package:auth_test/data/local_auth_service.dart';

class LocalAuth {
  Future<bool> authUser() async {
    return locator.get<LocalAuth>().authUser();
  }

  // Future<Null> logOut() async {
  //   locator.get<AuthRepo>().signOut();
  // }
}