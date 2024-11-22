import 'package:get_it/get_it.dart';

import 'package:auth_test/business/controller/local_auth_controller.dart';
import 'package:auth_test/data/local_auth.dart';

final locator = GetIt.instance;

void setupServices() async {
  locator.registerSingleton<LocalAuthController>(LocalAuthController());
  locator.registerSingleton<LocalAuth>(LocalAuth());
}