import 'package:product_catalog/src/h.dart';

@Injectable()
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState.pure()) {
    on<SplashReady>(_mapSplashReady);
    on<SplashPrepare>(_mapSplashPrepare);
  }

  void _mapSplashPrepare(SplashEvent event, Emitter<SplashState> emitter) {
    emit(const SplashState.navigateToHome());
  }

  void _mapSplashReady(SplashEvent event, Emitter<SplashState> emitter) {
    emit(const SplashState.pure());
  }

}