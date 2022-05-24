import 'package:product_catalog/src/h.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  try {
    await configureInjection();
    runApp(const RestartWidget(Application()));
  } catch (error) {
    Logger.debug('Locator setup has failed before starting app >> $error');
  }
}

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  ApplicationState createState() => ApplicationState();
}

class ApplicationState extends State<Application> {
  final _alice = Injector.locator<Alice>();
  final _route = Injector.locator<AppRouteRegistry>();

  @override
  Widget build(BuildContext context) {
    _route.initRouter();
    FlutterNativeSplash.remove();
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
        backgroundColor: HexColor.toColor(ColorManifest.BACKGROUND),
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.indigo,
        backgroundColor: HexColor.toColor(ColorManifest.BACKGROUND),
      ),
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) {
        return MaterialApp(
          debugShowCheckedModeBanner: BuildConfig.BUILD_STAGE_MODE,
          theme: theme,
          darkTheme: darkTheme,
          navigatorKey: _alice.getNavigatorKey(),
          home: const SplashPage(),
          onGenerateRoute: _route.router.generator,
        );
      }
    );
  }
}
