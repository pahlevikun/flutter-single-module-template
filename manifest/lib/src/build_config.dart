class BuildConfig {
  static const APP_ID = "com.deggan.productcatalog.app";
  static const _IS_STAGING = true;

  static const _PROD_BASE_URL = "http://157.175.85.34/";
  static const _DEV_BASE_URL = "http://157.175.85.34/";

  static const BASE_URL = _IS_STAGING ? _DEV_BASE_URL : _PROD_BASE_URL;
  static const BUILD_STAGE_MODE = BASE_URL == _DEV_BASE_URL ? true : false;
}
