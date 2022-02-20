import 'package:flutter/services.dart';
import 'package:integrations_flutter/platform/service.dart';

class PlatformServiceImpl implements PlatformService {
  static const platform = MethodChannel('CALL_METHOD');

  @override
  Future<void> setValue(String value) async {
    try {
      return await platform.invokeMethod('CALL', value);
    } on PlatformException catch (e) {
      print("Failed to set value: ${e.message}");
    }
  }
}
