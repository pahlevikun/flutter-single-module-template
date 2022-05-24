import 'package:product_catalog/src/h.dart';

import 'injector.config.dart';

final _locator = GetIt.instance;

class Injector {
  static final locator = _locator;
}

@injectableInit
Future<void> configureInjection() async => $initGetIt(_locator);
