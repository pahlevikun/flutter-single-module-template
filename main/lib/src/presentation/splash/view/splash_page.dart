import 'package:product_catalog/src/h.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    Key? key,
  }) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(
        builder: (context, orientation) {
          return ResponsiveSizer(
            builder: (context, orientation, screenType) {
              return Scaffold(
                body: BlocProvider(
                  create: (context) =>
                      Injector.locator<SplashBloc>()..add(const SplashEvent.ready()),
                  child: const SplashView(),
                ),
              );
            },
          );
        },
      );
    });
  }
}
