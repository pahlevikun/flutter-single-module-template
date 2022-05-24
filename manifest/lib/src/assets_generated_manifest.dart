import 'package:flutter/widgets.dart';

class AssetManifest {
  static const String en = "resources/lang/en.json";
}

class ImageManifest {
  static AssetImage get imgSplash => const AssetImage("../resources/image/img_splash.png", package: "manifest");
}

