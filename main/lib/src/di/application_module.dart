import 'package:product_catalog/src/h.dart';

@module
abstract class ApplicationModules {
  @Singleton()
  RxBus provideRxBus() => RxBus();

  @LazySingleton()
  ConnectionChecker provideConnectionChecker() =>
      ConnectionChecker.getInstance();

  @LazySingleton()
  PermissionHelper providePermissionHelper() => PermissionHelper();
}
