// Import Packages
import 'package:fluro/fluro.dart';
import 'package:spirit/pages/home_page.dart';

// Import Pages
//import 'package:spirit/pages/main_page.dart';

//import 'package:spirit/pages/auth_page/auth_page.dart';
//import 'package:spirit/pages/settings_page/settings_page.dart';
import 'package:spirit/pages/unknown_page.dart';

class MyFluroRouter {
  static FluroRouter router = FluroRouter();

  //static Handler mainHandler = Handler(handlerFunc: (context, Map<String, dynamic> params) => MainPage());
  static Handler homeHandler = Handler(handlerFunc: (context, Map<String, dynamic> params) => const HomePage());
  //static Handler authHandler = Handler(handlerFunc: (context, Map<String, dynamic> params) => const AuthPage());
  //static Handler settingsHandler = Handler(handlerFunc: (context, Map<String, dynamic> params) => const SettingsPage());

  static void setupRouter(){
    //router.define(MainPage.routeName, handler: mainHandler, transitionType: TransitionType.fadeIn);
    router.define(HomePage.routeName, handler: homeHandler, transitionType: TransitionType.fadeIn);
    //router.define(AuthPage.routeName, handler: authHandler, transitionType: TransitionType.fadeIn);
    //router.define(SettingsPage.routeName, handler: settingsHandler, transitionType: TransitionType.inFromRight);
    router.notFoundHandler = Handler(handlerFunc: (context, Map<String, dynamic> params) => const NotFoundPage());
  }
}