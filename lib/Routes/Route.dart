import 'package:flutter/material.dart';
import 'package:resumebuilder/Screens/Build_Option_Screen/build_options_page.dart';
import 'package:resumebuilder/Screens/Carrier_Onjective_Screen/carrier_objective_page.dart';
import 'package:resumebuilder/Screens/Contact_Info_Screen/contact_info_page.dart';
import 'package:resumebuilder/Screens/Home_Screen.dart';
import 'package:resumebuilder/Splash_Screen.dart';


class Routes {
  static MaterialPageRoute OnRouteGenerate(RouteSettings settings) {
    switch (settings.name) {
      case splash_screen.RouteName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => splash_screen(),
        );

      case homescreen.RouteName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => homescreen(),
        );

      case Build_Options_Page.RouteName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => Build_Options_Page(),
        );
      case contact_info_screen.RouteName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => contact_info_screen(
            title: (settings.arguments as Map)["title"],
          ),
        );

      case carrier_objective_screen.RouteName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => carrier_objective_screen(
            title: (settings.arguments as Map)["title"],
          ),
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
