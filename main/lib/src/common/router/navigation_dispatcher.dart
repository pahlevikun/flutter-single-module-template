import 'package:product_catalog/src/h.dart';

class NavigationDispatcher {
  final FluroRouter _router;

  NavigationDispatcher(this._router);

  void back(context, {dynamic result}) {
    _router.pop(context, result);
  }

  Future<dynamic> goToPath(
    BuildContext context,
    String path, {
    bool clearStack = false,
  }) async {
    return _router.navigateTo(
      context,
      path,
      clearStack: clearStack,
      transition: TransitionType.fadeIn,
    );
  }

  Future<dynamic> goToSplash(BuildContext context) async {
    return goToPath(context, AppRouteRegistry.splash);
  }
  Future<dynamic> goToHome(BuildContext context) async {
    return goToPath(context, AppRouteRegistry.home, clearStack: true);
  }
}
