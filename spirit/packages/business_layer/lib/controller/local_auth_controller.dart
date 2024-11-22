import 'package:business_layer/business_layer.dart';
import 'package:data_layer/data_layer.dart';

class LocalAuthController {
  Future<bool> checkBio() async => await locator.get<LocalAuth>().checkBio();
  Future<bool> authUser() async => await locator.get<LocalAuth>().authenticate();
}