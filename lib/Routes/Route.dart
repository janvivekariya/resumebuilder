import 'package:flutter/material.dart';
import 'package:resumebuilder/Splash_Screen.dart';

class Routes {
  static MaterialPageRoute OnRouteGenerate(RouteSettings settings) {
    switch (settings.name) {
      case splash_screen.RouteName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => splash_screen(),
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
