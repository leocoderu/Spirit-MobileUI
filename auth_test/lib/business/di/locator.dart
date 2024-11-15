import 'package:get_it/get_it.dart';

import 'package:auth_test/business/controller/local_auth_service.dart';
import 'package:auth_test/data/local_auth_service.dart';

final locator = GetIt.instance;

void setupServices() async {
  locator.registerSingleton<LocalAuthService>(LocalAuthService());
  locator.registerSingleton<LocalAuth>(LocalAuth());

}