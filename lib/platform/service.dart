import 'package:flutter/services.dart';
import 'package:integrations_flutter/ffi_bridge.dart';

import 'dummy/dummy_service.dart'
    if (dart.library.html) 'web/web_service.dart'
    if (dart.library.io) 'mobile/mobile_service.dart';

abstract class PlatformService {
  void setValue(String value);
  
  final _bridge = FFIBridge();

  int countCharacters(String text) {
    try{
      return _bridge.countCharacters(text);
    } on PlatformException catch(e){
      
      print("Failed to get value: ${e.message}");
      return 0;
    }
  }
}

PlatformService getService() {
  return PlatformServiceImpl();
}
