import 'package:flutter/services.dart';
import 'package:integrations_flutter/pigeon.dart';
import 'package:integrations_flutter/platform/service.dart';

class PlatformServiceImpl extends PlatformService {
  @override
  void setValue(String value) async {
    try {
      await NativeApi().setValue(value);
    } on PlatformException catch (e) {
      print("Failed to set value: ${e.message}");
    }
  }
}
