import 'package:product_catalog/src/h.dart';

part 'splash_event.freezed.dart';

@freezed
abstract class SplashEvent with _$SplashEvent {
  const factory SplashEvent.ready() = SplashReady;

  const factory SplashEvent.prepare() = SplashPrepare;
}
