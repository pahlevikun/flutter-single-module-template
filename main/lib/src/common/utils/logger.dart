import 'dart:developer';

import 'package:product_catalog/src/h.dart';

class Logger {
  static void debug(String message) {
    if (BuildConfig.BUILD_STAGE_MODE) {
      log("APP_LOGGER >>> $message");
    }
  }
}
