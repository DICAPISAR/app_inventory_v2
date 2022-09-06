import 'package:app_inventory/models/models.dart';
import 'package:app_inventory/screens/screens.dart';
import 'package:flutter/material.dart';

class Routes {
  static const initialRoute = 'login';

  static final routes = <ScreenRoute>[
    ScreenRoute(route: 'login', name: 'Login', screen: const LoginScreen()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    appRoutes.addAll({'home': (BuildContext context) => const LoginScreen()});

    /*
      for (final route in routes) {
        appRutes.addAll({route.route: (BuildContext context) => route.screen});
      }
    */

    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const LoginScreen());
  }
}
