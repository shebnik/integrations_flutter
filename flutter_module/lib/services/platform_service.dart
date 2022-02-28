import 'package:flutter/services.dart';

class PlatformService {
  static const platform = MethodChannel('CALL_METHOD');

  Future<int?> getValue() async {
    try {
      return await platform.invokeMethod('CALL');
    } on PlatformException catch (e) {
      print("Failed to set value: ${e.message}");
    }
    return null;
  }
}
