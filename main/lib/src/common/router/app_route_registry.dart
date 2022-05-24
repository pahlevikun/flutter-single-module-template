import 'package:product_catalog/src/h.dart';
import 'package:product_catalog/src/presentation/home_page.dart';

class AppRouteRegistry {
  final FluroRouter router;

  AppRouteRegistry(this.router);

  initRouter() {
    router.define(
      splash,
      handler: Handler(
        handlerFunc: (
          BuildContext? context,
          Map<String, List<String>> parameters,
        ) {
          return const SplashPage();
        },
      ),
    );
    router.define(
      home,
      handler: Handler(
        handlerFunc: (
            BuildContext? context,
            Map<String, List<String>> parameters,
            ) {
          return const MyHomePage(title: "Test");
        },
      ),
    );
  }

  static const splash = "/splash";
  static const home = "/home";
}
