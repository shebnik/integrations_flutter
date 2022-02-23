import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class NativeApi {
  
  void setValue(String value);
}
