// Import Flutter
import 'package:flutter/material.dart';

// Import Packages
import 'package:spirit/fluro_router.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Import Layers
import 'package:business_layer/business_layer.dart';
import 'package:spirit/pages/main_page.dart';

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
  setupServices();
  runApp(const MainPage());
}

