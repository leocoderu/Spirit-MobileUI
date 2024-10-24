// Import Flutter
import 'package:flutter/material.dart';
//import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

// Import Localizations
import 'package:spirit/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// Import Packages
import 'package:spirit/fluro_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MyFluroRouter.setupRouter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //return NeumorphicApp(
    return MaterialApp(

      title: 'Spirit project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // theme: NeumorphicThemeData(
      //   baseColor: Color(0xFFFFFFFF),
      //   lightSource: LightSource.topLeft,
      //   depth: 10,
      // ),
      // darkTheme: NeumorphicThemeData(
      //   baseColor: Color(0xFF3E3E3E),
      //   lightSource: LightSource.topLeft,
      //   depth: 6,
      // ),
      supportedLocales: L10n.all,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      initialRoute: '/',
      onGenerateRoute: MyFluroRouter.router.generator,
    );
  }
}

