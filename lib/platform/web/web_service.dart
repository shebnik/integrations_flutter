import 'package:integrations_flutter/platform/service.dart';
import 'package:integrations_flutter/platform/web/web_inerop.dart';

class PlatformServiceImpl implements PlatformService {
  final _manager = InteropManager();

  @override
  Future<void> setValue(String value) {
    return Future(() => _manager.setTextValue(value));
  }
}
