// STATIC ROUTES NAME
import 'package:flutter/material.dart';
import 'package:tele_health/screens/authentication/body.dart';
import 'package:tele_health/screens/authentication/define_user_screen.dart';

const String initialRoute = '/';
const String authBody = '/auth-body';

// ignore: todo
// TODO : ROUTES GENERATOR CLASS THAT CONTROLS THE FLOW OF NAVIGATION/ROUTING

class RouteGenerator {
  // FUNCTION THAT HANDLES ROUTING
  static Route<dynamic> onGeneratedRoutes(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return _getPageRoute(DefineUserScreen());

      case authBody:
        return _getPageRoute(AuthBody());

      default:
        return _errorRoute();
    }
  }

  // FUNCTION THAT HANDLES NAVIGATION
  static PageRoute _getPageRoute(Widget child) {
    return MaterialPageRoute(builder: (ctx) => child);
  }

  // 404 PAGE
  static PageRoute _errorRoute() {
    return MaterialPageRoute(builder: (ctx) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('404'),
        ),
        body: const Center(
          child: Text('ERROR 404: Not Found'),
        ),
      );
    });
  }
}
