import 'package:flutter/services.dart';

class PlatformService {
  static const platform = MethodChannel('CALL_METHOD');
  static const stream = EventChannel('CALL_EVENTS');

  @override
  Future<int> getValue() async {
    try {
      return await platform.invokeMethod('CALL');
    } on PlatformException catch (e) {
      print("Failed to get value: ${e.message}");
      return 0;
    }
  }

  @override
  Stream<int> getStream() =>
      stream.receiveBroadcastStream().map((event) => event as int);
}
