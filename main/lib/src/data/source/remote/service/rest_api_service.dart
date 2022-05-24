import 'package:dio/dio.dart' hide Headers;
import 'package:product_catalog/src/h.dart';
import 'package:retrofit/http.dart';

part 'rest_api_service.g.dart';

@RestApi(baseUrl: BuildConfig.BASE_URL)
abstract class RestApiService {
  factory RestApiService(Dio dio, {String baseUrl}) = _RestApiService;
}
