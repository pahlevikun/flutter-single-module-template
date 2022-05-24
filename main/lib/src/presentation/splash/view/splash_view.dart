import 'package:product_catalog/src/h.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends State<SplashView> {
  final _navigator = Injector.locator<NavigationDispatcher>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Future.delayed(
        const Duration(seconds: 3),
        () => context.read<SplashBloc>().add(const SplashEvent.prepare()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is NavigateToHome) _navigator.goToHome(context);
      },
      child: Center(
        child: BounceLoading(
          color: HexColor.toColor(ColorManifest.RED_COLOR),
        ),
      ),
    );
  }
}
