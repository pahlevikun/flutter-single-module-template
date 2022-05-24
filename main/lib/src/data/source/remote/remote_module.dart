import 'package:product_catalog/src/h.dart';

@module
abstract class RemoteModule {
  @LazySingleton()
  RemoteGateway provideRemoteGateway(RestApiService apiService) =>
      RemoteGateway(apiService);
}
