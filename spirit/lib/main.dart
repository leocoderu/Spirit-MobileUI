// Import Flutter
import 'package:flutter/material.dart';

// Import Localizations
import 'package:spirit/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// Import Packages
import 'package:spirit/fluro_router.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<void> preloadSVGs(List<String> assetPaths) async {
  for (final path in assetPaths) {
    final loader = SvgAssetLoader(path);
    await svg.cache.putIfAbsent(
      loader.cacheKey(null),
        () => loader.loadBytes(null),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await preloadSVGs([
    'assets/system/svg/logo.svg',
  ]);
  MyFluroRouter.setupRouter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spirit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
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

