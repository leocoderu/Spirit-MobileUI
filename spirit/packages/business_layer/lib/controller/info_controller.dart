import 'dart:isolate';

import 'package:business_layer/di/locator.dart';
import 'package:data_layer/data_layer.dart';

class InfoController {
  Future<void> getInfo1(SendPort sendPort) async =>
      await locator.get<InfoRepo>().getInfo1(sendPort);

  Future<void> getInfo2(SendPort sendPort) async =>
      await locator.get<InfoRepo>().getInfo2(sendPort);
}