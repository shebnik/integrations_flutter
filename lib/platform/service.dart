import 'dummy/dummy_service.dart'
    if (dart.library.html) 'web/web_service.dart'
    if (dart.library.io) 'mobile/mobile_service.dart';

abstract class PlatformService {
  Future<void> setValue(String value);
}

PlatformService getService() {
  return PlatformServiceImpl();
}
