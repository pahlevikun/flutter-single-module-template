import 'package:product_catalog/src/h.dart';

@module
abstract class ServiceModule {
  @factory
  RestApiService provideApiService(
    Dio dio,
    @Named("base_url") String baseUrl,
  ) {
    return RestApiService(
      dio,
      baseUrl: baseUrl,
    );
  }

  @factory
  DioAuthenticator provideDioAuthenticator(
    @Named("network_auth_storage") AuthGateway authGateway,
  ) {
    return DioAuthenticator(
      authGateway,
    );
  }

  @LazySingleton()
  Alice provideAlice(
    @Named("build_mode") bool shouldActive,
  ) {
    return Alice(
      showNotification: shouldActive,
      showInspectorOnShake: shouldActive,
    );
  }

  @LazySingleton()
  Dio provideDio(
    BaseOptions baseOptions,
    @Named("build_mode") bool shouldShowLogger,
    @Named("auth_storage") StorageGateway storageModule,
    RxBus rxBus,
    DioLogger dioLogger,
    Alice alice,
    DioAuthenticator authenticator,
  ) {
    final dio = Dio(baseOptions);
    dio.interceptors.add(authenticator);
    if (shouldShowLogger) {
      dio.interceptors.add(alice.getDioInterceptor());
      dio.interceptors.add(dioLogger);
    }
    return dio;
  }

  @Singleton()
  DioLogger provideDioLogger() {
    return DioLogger(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
      compact: true,
    );
  }

  @Singleton()
  BaseOptions provideDioBaseOptions(
    @Named("base_url") String baseUrl,
    @Named("headers") Map<String, String> headers,
    @Named("connect_time_out") int connectTimeOut,
    @Named("read_time_out") int readTimeOut,
  ) {
    return BaseOptions(
      baseUrl: baseUrl,
      headers: headers,
      connectTimeout: connectTimeOut,
      receiveTimeout: readTimeOut,
    );
  }

  @Named("headers")
  Future<Map<String, String>> provideHeaders() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    String code = packageInfo.buildNumber;
    String package = packageInfo.packageName;

    return {
      "Accept": "application/json",
      "x_app_version": version,
      "x_app_buildnumber": code,
      "x_package": package,
      "x_platform": Platform.isAndroid
          ? "android"
          : Platform.isIOS
              ? "iOS"
              : "unknown",
    };
  }

  @Singleton()
  @Named("base_url")
  String provideBaseUrl() => BuildConfig.BASE_URL;

  @Singleton()
  @Named("build_mode")
  bool provideBuildMode() => BuildConfig.BUILD_STAGE_MODE;

  @Singleton()
  @Named("read_time_out")
  int get readTimeOut => 15000;

  @Singleton()
  @Named("connect_time_out")
  int get connectTimeOut => 15000;
}
