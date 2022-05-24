import 'package:product_catalog/src/h.dart';

abstract class StorageGateway implements AuthGateway {}

class StorageGatewayImpl implements StorageGateway {
  AuthGateway authGateway;

  StorageGatewayImpl(this.authGateway);

  @override
  void deleteAccessToken() {
    authGateway.deleteAccessToken();
  }

  @override
  String getAccessToken() => authGateway.getAccessToken();

  @override
  void saveAccessToken(String accessToken) {
    authGateway.saveAccessToken(accessToken);
  }
}
