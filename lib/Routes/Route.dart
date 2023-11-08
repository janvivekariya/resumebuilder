import 'package:flutter/material.dart';
import 'package:resumebuilder/Screens/Home_Screen/Home_Screen.dart';
import 'package:resumebuilder/Screens/Option_Screen/Option_Screen.dart';


class Routes {
  static MaterialPageRoute OnRouteGenerate(RouteSettings settings) {
    switch (settings.name) {
      case Home_Screen.RouteName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => Home_Screen(),
        );

      case Option_Screen.RouteName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => Option_Screen(),
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const Material(
              child: Center(
            child: Text("404 page not found"),
          )),
        );
    }
  }
}
