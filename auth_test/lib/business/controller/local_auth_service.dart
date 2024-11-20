import 'package:auth_test/business/di/locator.dart';
import 'package:auth_test/data/local_auth_service.dart';

class LocalAuthService {
  Future<bool> authUser() async {
    return await locator.get<LocalAuth>().authenticate();
  }
}