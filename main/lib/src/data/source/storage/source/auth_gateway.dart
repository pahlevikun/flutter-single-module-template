import 'package:product_catalog/src/h.dart';

abstract class AuthGateway {
  void saveAccessToken(String accessToken);

  String getAccessToken();

  void deleteAccessToken();
}

class AuthGatewayImpl implements AuthGateway {
  PreferenceGateway gateway;

  AuthGatewayImpl(this.gateway);

  @override
  void deleteAccessToken() {
    gateway.removeFromDisk(_keyAccessToken);
  }

  @override
  String getAccessToken() => gateway.getFromDisk(_keyAccessToken);

  @override
  void saveAccessToken(String accessToken) {
    gateway.saveToDisk(_keyAccessToken, accessToken);
  }

  static const String _keyAccessToken = "${BuildConfig.APP_ID}.pref.auth.access_token";
}
