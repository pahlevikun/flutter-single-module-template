import 'package:product_catalog/src/h.dart';

part 'splash_state.freezed.dart';

@freezed
abstract class SplashState with _$SplashState {
  const factory SplashState.pure() = Pure;

  const factory SplashState.navigateToHome() = NavigateToHome;
}
