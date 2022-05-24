import 'package:product_catalog/src/domain/contract/repository_contract.dart';
import 'package:product_catalog/src/h.dart';

class RepositoryImpl implements Repository {
  StorageGateway storageGateway;
  RemoteGateway remoteGateway;

  RepositoryImpl(
    this.storageGateway,
    this.remoteGateway,
  );

  @override
  void deleteAccessToken() {
    storageGateway.deleteAccessToken();
  }

  @override
  String getAccessToken() {
    return storageGateway.getAccessToken();
  }

  @override
  void saveAccessToken(String accessToken) {
    storageGateway.saveAccessToken(accessToken);
  }
}
