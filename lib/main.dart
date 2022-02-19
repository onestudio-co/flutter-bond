import 'package:fixit/routes/app_router.dart';
import 'package:flutter/material.dart';

import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(FixitApp(appRouter: sl<AppRouter>()));
}

class FixitApp extends StatelessWidget {
  const FixitApp({Key? key, required this.appRouter}) : super(key: key);

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
        theme: ThemeData(
          primarySwatch: MaterialColor(0xFF5158F6, color),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            iconTheme: IconThemeData(color: secondaryColor),
            elevation: 0,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: secondaryColor,
              padding: const EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              textStyle: const TextStyle(fontSize: 16),
            ),
          ),
        ));
  }
}

const primaryColor = Color(0xFF5158F6);
const secondaryColor = Color(0xff65C8D3);

Map<int, Color> color = const {
  50: Color.fromRGBO(81, 88, 246, .1),
  100: Color.fromRGBO(81, 88, 246, .2),
  200: Color.fromRGBO(81, 88, 246, .3),
  300: Color.fromRGBO(81, 88, 246, .4),
  400: Color.fromRGBO(81, 88, 246, .5),
  500: Color.fromRGBO(81, 88, 246, .6),
  600: Color.fromRGBO(81, 88, 246, .7),
  700: Color.fromRGBO(81, 88, 246, .8),
  800: Color.fromRGBO(81, 88, 246, .9),
  900: Color.fromRGBO(81, 88, 246, 1),
};
