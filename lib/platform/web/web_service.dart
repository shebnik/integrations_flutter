import 'package:integrations_flutter/platform/service.dart';
import 'package:integrations_flutter/platform/web/web_inerop.dart';

class PlatformServiceImpl extends PlatformService {
  final _manager = InteropManager();

  @override
  void setValue(String value) {
    return _manager.setTextValue(value);
  }
}
