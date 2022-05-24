import 'package:product_catalog/src/h.dart';

@module
abstract class StorageModule {
  @preResolve
  @Singleton()
  Future<SharedPreferences> provideSharedPreferences() =>
      SharedPreferences.getInstance();

  @LazySingleton()
  PreferenceGateway providePreferenceGateway(
          SharedPreferences sharedPreferences) =>
      PreferenceGateway(sharedPreferences);

  @LazySingleton()
  @Named("auth_gateway")
  AuthGateway provideAuthGateway(PreferenceGateway gateway) =>
      AuthGatewayImpl(gateway);

  @factoryMethod
  @Named("network_auth_storage")
  AuthGateway provideNetworkAuthGateway(PreferenceGateway gateway) =>
      AuthGatewayImpl(gateway);

  @LazySingleton()
  StorageGateway provideStorageGateway(@Named("auth_gateway") AuthGateway authGateway) =>
      StorageGatewayImpl(authGateway);
}
