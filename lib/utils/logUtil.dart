
import 'package:flutter/foundation.dart';

class LogUtil {
  static void log(String message) {
    if (kDebugMode) {
      print(message);
    }
  }
}
