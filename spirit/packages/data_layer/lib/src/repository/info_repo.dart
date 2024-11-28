import 'dart:isolate';

Future<void> getInfo(SendPort sendPort) async {
  double total = 0.0;
  for (double i = 0; i < 1000; i++) total += i;
  sendPort.send(total);
}

class InfoRepo {
  static Future<void> getInfo1(SendPort sendPort) async {
    double total = 0.0;
    for (double i = 0; i < 1000; i++) total += i;
    sendPort.send(total);
  }

  static Future<void> getInfo2(SendPort sendPort) async {
    double total = 0.0;
    for (double i = 0; i < 50000000; i++) total += i;
    sendPort.send(total);
  }
}