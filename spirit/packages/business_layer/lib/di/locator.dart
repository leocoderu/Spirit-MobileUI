import 'package:get_it/get_it.dart';

import 'package:business_layer/business_layer.dart';
import 'package:data_layer/data_layer.dart';

final locator = GetIt.instance;

void setupServices() async {
  locator.registerSingleton<LocalPin>(LocalPin());
  locator.registerSingleton<LocalPinController>(LocalPinController());

  locator.registerSingleton<LocalAuthController>(LocalAuthController());
  locator.registerSingleton<LocalAuth>(LocalAuth());

  //
  // locator.registerSingleton<ProductRepo>(ProductRepo());
  // locator.registerSingleton<ProdController>(ProdController());
  //
  // locator.registerSingleton<PlaceRepo>(PlaceRepo());
  // locator.registerSingleton<PlaceController>(PlaceController());
  //
  // locator.registerSingleton<CurrencyRepo>(CurrencyRepo());
  // locator.registerSingleton<CurrencyController>(CurrencyController());
  //
  // locator.registerSingleton<UnitRepo>(UnitRepo());
  // locator.registerSingleton<UnitController>(UnitController());

  //await Hive.initFlutter();
  //await Hive.openBox<AppStateModel>('store_box'); //WARNING!!!: May be isn't necessary type AppStateModel
}