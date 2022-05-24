import 'package:product_catalog/src/h.dart';

@module
abstract class RepositoryModule {
  @LazySingleton()
  Repository provideRepository(
    StorageGateway storageGateway,
    RemoteGateway remoteGateway,
  ) {
    return RepositoryImpl(
      storageGateway,
      remoteGateway,
    );
  }
}
