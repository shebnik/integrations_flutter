@JS('IntegrationsNamespace')
library interop;

import 'package:js/js.dart';
import 'dart:ui' as ui;

@JS('JSInteropManager')
class _JSInteropManager {
  external dynamic get textElement;

  external void setTextValue(String value);
}

class InteropManager {
  final _interop = _JSInteropManager();
  InteropManager() {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'web-text',
      (viewId) => _interop.textElement,
    );
  }

  void setTextValue(String value) => _interop.setTextValue(value);
}
