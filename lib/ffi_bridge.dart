import 'dart:ffi';
import 'dart:io' show Platform;

import 'package:ffi/ffi.dart';

typedef CountCharacters = Int16 Function(Pointer<Utf8> s);
typedef CountCharactersDart = int Function(Pointer<Utf8> s);

class FFIBridge {
  late CountCharactersDart _countCharacters;

  FFIBridge() {
    final dl = Platform.isAndroid
        ? DynamicLibrary.open('libsimple.so')
        : DynamicLibrary.process();
    _countCharacters = dl.lookupFunction<CountCharacters, CountCharactersDart>(
        'count');
  }

  int countCharacters(String text) => _countCharacters(text.toNativeUtf8());
}
