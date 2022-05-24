import 'package:product_catalog/src/h.dart';

part 'network_exception.freezed.dart';

@freezed
abstract class NetworkException with _$NetworkException {
  const factory NetworkException.requestCancelled() = RequestCancelled;

  const factory NetworkException.unknownError(
    int? serverCode,
    int? errorCode,
    String? message,
  ) = UnknownError;

  const factory NetworkException.connectionTimeout() = ConnectionTimeout;

  const factory NetworkException.sendTimeout() = SendTimeout;

  const factory NetworkException.receiveTimeout() = ReceiveTimeout;

  const factory NetworkException.noInternetConnection() = NoInternetConnection;

  const factory NetworkException.badRequest() = BadRequest;

  const factory NetworkException.unProcessableEntity(
    int? serverCode,
    int? errorCode,
    String? message,
  ) = UnProcessableEntity;

  const factory NetworkException.unAuthorized(
    int? serverCode,
    int? errorCode,
    String? message,
  ) = UnAuthorized;

  const factory NetworkException.conflicted(
    int? serverCode,
    int? errorCode,
    String? message,
  ) = Conflicted;

  const factory NetworkException.serverError(
    int? serverCode,
    int? errorCode,
    String? message,
  ) = ServerError;

  const factory NetworkException.rateLimit(
    int? serverCode,
    int? errorCode,
    String? message,
  ) = RateLimit;

  const factory NetworkException.forbidden(
    int? serverCode,
    int? errorCode,
    String? message,
  ) = Forbidden;

  static NetworkException getDioException(error) {
    if (error is Exception) {
      try {
        late NetworkException networkExceptions;
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              networkExceptions = const NetworkException.requestCancelled();
              break;
            case DioErrorType.connectTimeout:
              networkExceptions = const NetworkException.connectionTimeout();
              break;
            case DioErrorType.sendTimeout:
              networkExceptions = const NetworkException.sendTimeout();
              break;
            case DioErrorType.other:
              networkExceptions = const NetworkException.noInternetConnection();
              break;
            case DioErrorType.receiveTimeout:
              networkExceptions = const NetworkException.receiveTimeout();
              break;
            case DioErrorType.response:
              final serverCode = error.response?.statusCode ?? 0;
              final errorResponse = error.response?.data;
              switch (serverCode) {
                case 401:
                  networkExceptions = NetworkException.unAuthorized(
                    serverCode,
                    errorResponse?.code ?? 401,
                    errorResponse?.message ?? "",
                  );
                  break;
                case 403:
                  networkExceptions = NetworkException.forbidden(
                    serverCode,
                    errorResponse?.code ?? 403,
                    errorResponse?.message ?? "",
                  );
                  break;
                case 409:
                  networkExceptions = NetworkException.conflicted(
                    serverCode,
                    errorResponse?.code ?? 409,
                    errorResponse?.message ?? "",
                  );
                  break;
                case 500:
                  networkExceptions = NetworkException.serverError(
                    serverCode,
                    errorResponse?.code ?? 500,
                    errorResponse?.message ?? "",
                  );
                  break;
                case 503:
                  networkExceptions = NetworkException.serverError(
                    serverCode,
                    errorResponse?.code ?? 503,
                    errorResponse?.message ?? "",
                  );
                  break;
                default:
                  networkExceptions = NetworkException.unknownError(
                    serverCode,
                    errorResponse?.code,
                    errorResponse?.message,
                  );
              }
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = const NetworkException.noInternetConnection();
        } else {
          networkExceptions = const NetworkException.unknownError(
            null,
            null,
            null,
          );
        }
        return networkExceptions;
      } catch (_) {
        return const NetworkException.unknownError(
          null,
          null,
          null,
        );
      }
    } else {
      if (error is NetworkException) {
        return const NetworkException.noInternetConnection();
      } else {
        return const NetworkException.unknownError(
          null,
          null,
          null,
        );
      }
    }
  }

  static String getErrorMessage(NetworkException networkExceptions) {
    var errorMessage = "Something wrong happens";
    networkExceptions.when(
      requestCancelled: () {
        errorMessage = "request cancelled";
      },
      unknownError: (int? serverCode, int? errorCode, String? message) {
        errorMessage = message ?? "unknown error";
      },
      connectionTimeout: () {
        errorMessage = "connection timeout";
      },
      sendTimeout: () {
        errorMessage = "send timeout";
      },
      receiveTimeout: () {
        errorMessage = "receive timeout";
      },
      noInternetConnection: () {
        errorMessage = "no internet connection";
      },
      badRequest: () {
        errorMessage = "bad request";
      },
      unProcessableEntity: (int? serverCode, int? errorCode, String? message) {
        errorMessage = message ?? "unprocessable entity";
      },
      unAuthorized: (int? serverCode, int? errorCode, String? message) {
        errorMessage = message ?? "unauthorized";
      },
      conflicted: (int? serverCode, int? errorCode, String? message) {
        errorMessage = message ?? "conflicted";
      },
      serverError: (int? serverCode, int? errorCode, String? message) {
        errorMessage = message ?? "server error";
      },
      rateLimit: (int? serverCode, int? errorCode, String? message) {
        errorMessage = message ?? "rate limit";
      },
      forbidden: (int? serverCode, int? errorCode, String? message) {
        errorMessage = message ?? "forbidden";
      },
    );
    return errorMessage;
  }
}
