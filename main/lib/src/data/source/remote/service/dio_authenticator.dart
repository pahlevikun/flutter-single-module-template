import 'package:product_catalog/src/h.dart';

class DioAuthenticator extends InterceptorsWrapper {
  AuthGateway authGateway;

  DioAuthenticator(this.authGateway);

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    String token = authGateway.getAccessToken();
    if (token.toString().isNotEmpty) {
      options.headers.addAll({
        'Authorization': 'Bearer $token',
        'X-App-Id': BuildConfig.APP_ID,
      });
    } else {
      options.headers.addAll({
        'X-App-Id': BuildConfig.APP_ID,
      });
    }
    handler.next(options);
    return super.onRequest(options, handler);
  }
}
