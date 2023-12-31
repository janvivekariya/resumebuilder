import 'package:flutter/material.dart';
import 'package:resumebuilder/Screens/Carrier_Onjective_Screen/Carrier_Objective_Screen.dart';
import 'package:resumebuilder/Screens/Contact_Info_Screen/Contact_Info_Screen.dart';
import 'package:resumebuilder/Screens/Education_Screen/Education_Screen.dart';
import 'package:resumebuilder/Screens/Experience_Screen/Experience_Screen.dart';
import 'package:resumebuilder/Screens/Home_Screen/Home_Screen.dart';
import 'package:resumebuilder/Screens/Option_Screen/Option_Screen.dart';
import 'package:resumebuilder/Screens/PDF_Screen/PDF_Screen.dart';
import 'package:resumebuilder/Screens/Personal_Details_Screen/Personal_Detail_Screen.dart';
import 'package:resumebuilder/Screens/Technical_Skill_Screen/Technical_Skills_Screen.dart';


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
          builder: (context) => Option_Screen(
            index: (settings.arguments as Map)["index"],
          ),
        );

      case Contact_Info_Screen.RouteName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => Contact_Info_Screen(),
        );

      case Carrier_Objective_Screen.RouteName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => Carrier_Objective_Screen(),
        );

      case Personal_Detail_Screen.RouteName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => Personal_Detail_Screen(),
        );

      case Education_Screen.RouteName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => Education_Screen(),
        );

      case Experience_Screen.RouteName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => Experience_Screen(),
        );

      case Technical_Skills_Screen.RouteName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => Technical_Skills_Screen(),
        );

      case PDF_Screen.RouteName:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => PDF_Screen(),
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
